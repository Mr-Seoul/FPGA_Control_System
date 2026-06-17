# ADC Design and calculations

In order to digitize the thermister voltage, we built an 8 bit SAR ADC.

Available comparators

| Comparator                     |  LM393N   |  LM311N[1] |
|:-------------------------------|:---------:|-----------:|
| Response Time (5 mV overDrive) | 1.3$\mu$s |     200 ns |

The comparator used was a LM311N. 
While the 5v supply voltage does complicate the PCB, it does reduce the response time by a factor 6x.

We decided on 8 bits due to the sensitivity of the comparator and the FPGA pinout.
The FPGA has 8 data pins per 2 pmods on the same level. Going above 8 bits would make the PCB more complicated.
Additionally, at 8 bits, the quantisation level is $ \frac{3.3V}{2^8} = 13 mV (+-6.35 mV to the nearest quantisation step) $ (3.3 since only the supply voltage is 5V, the logic is all on 3.3V). 
That ensures that the average error between the input and DAC output for the LSB is on average 3.25 mV, giving a 400 ns low to high response time (at 2 mV response time).
Adding more bits would only add even more noise, as most ICs only give information for 2mV overdrives in the worst case scenario.
Choosing 8 bits is a good compromise between precision, ease of use and noise.

## PCB Layout

## Sampling Rate

## Temperature Accuracy and Resolutions

# ADC Building Process

## Perf board iterations

### Iteration 1:
We began with standard 1 kOhm resistors. 
Halfway through soldering, we realized that the tolerances (+/- 5%) would destroy the tolerances, and decided to redo the board.

### Iteration 2:
We switches to 820 Ohm resistors with +/- 1% tolerances.
We also introduced a 9th bit to the DAC which we permanently toggled on. 
This would bias the DAC voltage by 0.5 bits, which would allow us to convert the ADC into a rounding ADC, halving the absolute error from \[0, 1 bit], to \[-0.5 bit, 0.5 bit].
This worked, but we noticed some non-linearity and a large dc offset.
![InitialLinearity.png](InitialLinearity.png)

As you can see, it looks quite linear, but as you can see below:
![InitialError.png](InitialError.png)
The error can be quite large and jumps around from being too high and too low.
We stopped measuring after we noticed how bad the DAC was performing. 
After some trouble shooting, we learned that the FPGA wasn't outputting 3.3v for HIGH signals, but inbetween 3.1 and 3.3.
That was because we misunderstood the datasheet. The datasheet says that the FGPA can handle 16 mA per pin, but it means that it can hold a HIGH signal for up to 16 mA, or above 1.65V. 
That is not good enough for our purposes, so we went back to the drawing board.

## Iteration 3
We replaced the resistors with 6.8 kOhm resistors, because when measuring, each pin now output 3.29V or 3.3V.
That did come at the cost of increased propogation time in the DAC, which is an unfortunate but neccesary trade off at this point.
That gave us the following graph:
![Rev2DACLinearity.png](Rev2DACLinearity.png)


## Iteration 4
The main issue was the 8th bit delivering too little voltage, and the 16 / 64 bit delivering too much. 
Hence we reduced the resistance on the 8th bit 2R resistors and increased on the 5th/7th bit 2R resistors, which gave us the following errors:
![Rev3DACLinearity.png](Rev3DACLinearity.png)

This shows that the DAC is always within 2.5 mV, which is perfect for our use case, and we can go on to the comparator installation.

## Mistake
We mistakenly used the formula $ \frac{ADC}{255}*3300mV + 6.44mV$ rather than $ \frac{ADC}{256}*3300mV + 6.44mV$.
Instead of making another PCB, we decided to make a LUT in software to map the read voltage to the correct temperature.
This approach still works as each bin (voltage per bit) is now 12.9+-2mV mV rather than 12.8+-2mV mVm which is still very reliable.
The last bit is now a bit comprimised (only spans 6.5 mV), but since in our project the voltage never should go that high, this fix should work for this project.
For next time, we should definitely use the correct formula as it would fix the issue with the reduced range for the last bit.

# Final Result

## Linearity

## Noise at 150 kHz

## Comparison to MCU


# Sources:

[1] Texas_Instruments-LM311N-NOPB-datasheet.pdf
[2] NTCM-10K-B3380.pdf
[3] esp32_datasheet_en.pdf
