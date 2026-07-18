package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class PID_tb extends AnyFlatSpec with ChiselScalatestTester {
  val maxTimeout = 1000
  val size = 5
  val minVal = -16.0
  val maxVal = 16.0
  val minPeriod = 2
  val maxPeriod = 10

  //Chosen to ensure relay doesn't switch too quickly
  val minOutput = 0.05
  val maxOutput = 0.95

  val minResponse = -math.pow(2,config.fixedWidth-1)/math.pow(2,config.decimalWidth)
  val maxResponse = (math.pow(2,config.fixedWidth-1) - 1)/math.pow(2,config.decimalWidth)

  it should "Calculate P correctly" in {
    val updatePeriods = randNums(minPeriod,maxPeriod,nTests)

    val pInputs = Seq(
      List.fill(1)(0.0),
      List.fill(1)(minVal),
      List.fill(1)(maxVal),
      List.fill(size)(randDouble(minVal+1.0,-1.0)),
      List.fill(size)(randDouble(1.0,maxVal-1.0)),
    )
    for (pList <- pInputs) {
      for (p <- pList) {
        for (updatePeriod <- updatePeriods) {
          test(new PID(1,updatePeriod)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            resetDUT(dut, maxTimeout)
            dut.io.P.poke(p)

            val eInputs = Seq(
              List.fill(1)(0.0),
              List.fill(1)(minVal),
              List.fill(1)(maxVal),
              List.fill(size)(randDouble(minVal+1.0,-1.0)),
              List.fill(size)(randDouble(1.0,maxVal-1.0)),
            )
            for (errorList <- eInputs) {
              for (e <- errorList) {
                dut.io.e.poke(e)
                dut.clock.step(updatePeriod)
                dut.io.pResponse.expect(clampDouble(p*e,minResponse,maxResponse))
              }
            }
          }
        }
      }
    }
  }

  it should "Calculate I correctly" in {
    val updatePeriods = randNums(minPeriod,maxPeriod,nTests)
    val errorPeriods = randNums(minPeriod,maxPeriod,size)

    val iInputs = Seq(
      List.fill(1)(0.0),
      List.fill(1)(minVal),
      List.fill(1)(maxVal),
      List.fill(size)(randDouble(minVal+1.0,-1.0)),
      List.fill(size)(randDouble(1.0,maxVal-1.0)),
    )
    for (errorPeriod <- errorPeriods) {
      for (iList <- iInputs) {
        for (i <- iList) {
          for (updatePeriod <- updatePeriods) {
            test(new PID(errorPeriod,updatePeriod)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
              resetDUT(dut, maxTimeout)
              dut.io.I.poke(i)
              dut.clock.step(updatePeriod-1)

              val eInputs = randDoubles(minVal,maxVal,errorPeriod)
              var totError = 0.0
              for (e <- eInputs) {
                dut.io.e.poke(e)
                totError += e
                dut.clock.step(updatePeriod)
              }
              dut.io.e.poke(0.0)
              dut.clock.step(updatePeriod)
              dut.io.iResponse.expect(clampDouble(i*totError,minResponse,maxResponse))
            }
          }
        }
      }
    }
  }

  it should "Calculate D correctly" in {
    val updatePeriods = randNums(minPeriod,maxPeriod,nTests)

    val dInputs = Seq(
      List.fill(1)(0.0),
      List.fill(1)(maxVal),
      List.fill(1)(minVal),
      List.fill(size)(randDouble(minVal+1.0,-1.0)),
      List.fill(size)(randDouble(1.0,maxVal-1.0)),
    )
    for (dList <- dInputs) {
      for (d <- dList) {
        for (updatePeriod <- updatePeriods) {
          var lastE = 0.0
          test(new PID(1,updatePeriod)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            resetDUT(dut, maxTimeout)
            dut.io.D.poke(d)

            dut.clock.step(updatePeriod-1)

            val eInputs = Seq(
              List.fill(2)(0.0),
              List.fill(2)(minVal),
              List.fill(2)(maxVal),
              List.fill(size)(randDouble(minVal+1.0,-1.0)),
              List.fill(size)(randDouble(1.0,maxVal-1.0)),
            )
            for (errorList <- eInputs) {
              for (e <- errorList) {
                dut.io.e.poke(e)
                dut.clock.step(updatePeriod)
                dut.io.dResponse.expect(clampDouble(d*(e-lastE),minResponse,maxResponse))
                lastE = e
              }
            }
          }
        }
      }
    }
  }

  it should "Calculate totalEffort correctly" in {
    val updatePeriods = randNums(minPeriod,maxPeriod,nTests)
    val errorPeriods = randNums(minPeriod,maxPeriod,size)

    val Inputs = Seq(
      List.fill(3)(0.0),
      List.fill(3)(maxVal),
      List.fill(3)(minVal),
      List.fill(3)(randDouble(minVal+1.0,-1.0)),
      List.fill(3)(randDouble(1.0,maxVal-1.0)),
    )

    for (errorPeriod <- errorPeriods) {
      for (values <- Inputs) {
        for (updatePeriod <- updatePeriods) {
          var lastE = 0.0
          test(new PID(errorPeriod,updatePeriod)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            resetDUT(dut, maxTimeout)
            val p = values(0)
            val i = values(1)
            val d = values(2)

            dut.io.P.poke(p)
            dut.io.I.poke(i)
            dut.io.D.poke(d)

            dut.clock.step(updatePeriod-1)

            val eInputs = Seq(
              List.fill(size)(randDouble(1.0,maxVal-1.0)),
            )
            for (errorList <- eInputs) {
              for (e <- errorList) {
                dut.io.e.poke(e)
                dut.clock.step(updatePeriod)
                val expectedTotal = dut.io.pResponse.peekDouble() + dut.io.iResponse.peekDouble() + dut.io.dResponse.peekDouble()
                dut.io.response.expect(clampDouble(expectedTotal,minOutput,maxOutput))
              }
            }
          }
        }
      }
    }
  }
}