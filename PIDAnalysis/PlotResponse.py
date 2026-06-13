import cocotb
from cocotb.triggers import FallingEdge, Timer
import matplotlib.pyplot as plt

async def generate_clock(dut):
    """Generate clock pulses."""

    for _ in range(10):
        dut.clk.value = 0
        await Timer(1, unit="ns")
        dut.clk.value = 1
        await Timer(1, unit="ns")

@cocotb.test()
async def plotResponse(dut):
    """Plot the response of the PID"""

    cocotb.start_soon(generate_clock(dut))

    heatingArray = []

    dut.io_target = 25
    dut.io_cur = 24

    print("A")

    for i in range(100):
        await FallingEdge(dut.clk)
        heatingArray.append(dut.io_heatingResponse.value)

    plt.plot(heatingArray)
    plt.show()
