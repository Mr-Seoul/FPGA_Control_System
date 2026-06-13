import matplotlib.pyplot as plt
from  ADCDesign.NTCData import tempToRes

minTemp = 0
maxTemp = 25
temperatureDataPoints = 100

temperatureData = [i for i in range(minTemp,maxTemp+1)]

voltage = 3.3
RSetA = 16600
ADCBits = 6

def voltageDivider(voltage, rSet, temp):
    resTot = rSet + tempToRes(temp)
    resMeasured = tempToRes(temp)
    return voltage*(resMeasured/resTot)

def tempToVoltage(temp, curR):
    return voltageDivider(voltage,curR, temp)

def voltageToTemp(temp):
    return voltageDivider(voltage,RSetA, temp)

voltageData = [tempToVoltage(temp, RSetA) for temp in temperatureData]

plt.plot(temperatureData, voltageData)
plt.show()

print(f"Voltage at {minTemp}: ", tempToVoltage(minTemp,RSetA))
print(f"Voltage at {maxTemp}: ", tempToVoltage(maxTemp, RSetA))

voltageSpan = tempToVoltage(minTemp,RSetA) - tempToVoltage(maxTemp,RSetA)
adcSpan = (voltageSpan / voltage) * 2**(ADCBits)
tempSpan = maxTemp - minTemp
resolution = tempSpan / adcSpan

print(f"Temperature resolution: ", resolution)
