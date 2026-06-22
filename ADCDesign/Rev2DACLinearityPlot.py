import matplotlib.pyplot as plt

Data = {
    0:6.7,1:19.8,2:33.1,3:46.2,4:58.9,7:98.4,8:110.6,15:202.3,16:215.4,31:411,32:421,63:826,64:837,127:1657,128:1656
}

def expected(ADC):
    return 3300*((ADC)/255)+6.47
    # Note that this is not the textbook formula, we explained this choice in the readme.
    # In short, if we did / 256, we would have 257 ranges which can't be read by a standard SAR algorithm.
    # We solved that with 2 0.5LSB ranges on the edges and the rest being slightly larger than 1 LSB.

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