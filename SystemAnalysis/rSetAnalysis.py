from ADCDesign.NTCData import *
import matplotlib.pyplot as plt

def voltageDivider(voltage, rSet, temp):
    resTot = rSet + tempToRes(temp)
    resMeasured = tempToRes(temp)
    return voltage*(resMeasured/resTot)

voltage = 3.3
minR = 100
maxR = 100000
rStep = 100

minTemp = 0
maxTemp = 25

def tempToVoltage(temp, curR):
    return voltageDivider(voltage,curR, temp)
rData = list(range(minR,maxR,rStep))

voltageData = [tempToVoltage(minTemp,r) - tempToVoltage(maxTemp,r) for r in rData]

plt.plot(rData, voltageData)
plt.show()
print("Max Range: ", max(voltageData), "at R = ", rData[voltageData.index(max(voltageData))])
