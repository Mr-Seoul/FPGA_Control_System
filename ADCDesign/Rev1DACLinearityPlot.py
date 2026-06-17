import matplotlib.pyplot as plt

Data = {
    0:8.3,1:23.3,2:37.3,3:52.3,4:64.2,5:79.2,6:93.3,7:108.3,
    8:116.1,9:131.2,10:145.3,11:160.3,12:172.1,13:187.2,14:201.3,15:216.4,
    16:227.7,17:242.8,18:256.8,19:271.9,20:283.8,21:298.8,22:310,23:324.9,
    24:332.7,25:347.5,26:361.4,27:376.5,28:388.2,29:403.3,30:417,31:432,
    32:431,33:446,
    64:837,
    128:1628,
    255:3307
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