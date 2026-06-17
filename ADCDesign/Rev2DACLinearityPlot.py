import matplotlib.pyplot as plt

Data = {
    0:6.7,1:19.8,2:33.1,3:46.2,4:58.9,7:98.4,8:110.6,15:202.3,16:215.4,31:411,32:421,63:826,64:837,127:1657,128:1656
}

def expected(ADC):
    return 3300*((ADC)/255)+6.44
    #We realized this formula was a mistake later on (should be /256).
    #We fixed this using a lookup table in software later as the DAC is still very linear

xData = [i for i in Data.keys()]
yData = [Data[i] for i in xData]

expectedYdata = [expected(i) for i in xData]
diffData = [Data[i] - expected(i) for i in xData]

plt.plot(xData, yData)
plt.plot(xData, expectedYdata)
plt.show()

plt.plot(xData, yData)
plt.plot(xData, expectedYdata)
plt.show()

plt.plot(xData, diffData)
plt.show()

print(diffData)