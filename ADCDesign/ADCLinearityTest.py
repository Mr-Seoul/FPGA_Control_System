import matplotlib.pyplot as plt

Data = {
    0:0,10:1,120:9,310:24,400:31,500:39,600:47,700:54,800:63,900:70,1000:77,1100:85,1200:93,1300:100,1400:108,1500:116,1600:123,1700:131,1800:139,1900:146,2000:154,2100:162,2200:170,2300:177,2400:185,2500:193,2600:200,2700:208,2800:215,2900:224,3000:231,3100:239,3200:247,3300:255
}

xData = [i for i in Data.keys()]
yData = [Data[i] for i in xData]

plt.plot(xData, yData,label="ADC code (Tested at 50kSHz)")
plt.xlabel("Voltage input (mV)")
plt.ylabel("ADC Code (unitless)")
plt.legend(loc="upper left")
plt.show()