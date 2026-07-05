import NTCData as NTC
import numpy as np
import matplotlib.pyplot as plt

def clamp(value, minValue, maxValue):
    return max(min(value, maxValue), minValue)

rSet = 16600

def resToVoltage(res):
    return (res/(rSet + res))*3300

def ADCtoVoltage(ADC):
    return (ADC/256)*3300 #This is only because of the design decision we made to have smaller buckets in the first and last ADC code

x = list(range(-55,125))
y = [resToVoltage(NTC.tempToRes(i)) for i in x]
plt.plot(y,x)
plt.show()

coefficients = np.polyfit(y, x, 10)
print(coefficients)
voltageToTemp = np.poly1d(coefficients)
yApprox = [voltageToTemp(i) for i in y]
plt.plot(y,yApprox)
plt.show()

ADCCodes = [i for i in range(256)]
ADCTemps = [voltageToTemp(ADCtoVoltage(i)) for i in ADCCodes]
for i in range(256):
    ADCTemps[i] = clamp(ADCTemps[i],-127,127)
plt.plot(ADCCodes,ADCTemps)
plt.show()

def floatToQ824F(val):
    fractional_bits = 24
    scaling_factor = 1 << fractional_bits

    max_val = (1 << (8 - 1)) - (1 / scaling_factor)
    min_val = -(1 << (8 - 1))

    if val > max_val:
        val = max_val
    elif val < min_val:
        val = min_val

    q_val = round(val * scaling_factor) & 0xFFFFFFFF
    fmt = "08X"

    return f"{q_val:{fmt}}"

for i in range(256):
    ADCTemps[i] = floatToQ824F(ADCTemps[i])
    if (i != 255):
        ADCTemps[i] += "\n"

with open("lookup.hex", "w", encoding="utf-8") as file:
    file.writelines(ADCTemps)