# ADC Design

In order to digitize the thermister voltage, we built an 8 bit SAR ADC.

Available comparators

| Comparator                     |  LM393N   | LM311N[1] |
|:-------------------------------|:---------:|----------:|
| Response Time (5 mV overDrive) | 1.3$\mu$s |    300 ns |

The comparator used was a LM311N. 
While the 5v supply voltage did complicate the PCB, it does reduce the response time by a factor 6x.

We decided on 8 bits due to the sensitivity of the comparator and the FPGA pinout.
The FPGA has 8 data pins per 2 pmods on the same level. Going above 8 bits would make the PCB more complicated.
Additionally, at 8 bits, the quantisation level is $ \frac{3.3V}{2^8} = 13 mV (+-6.35 mV to the nearest quantisation step) $ (3.3 since only the supply voltage is 5V, the logic is all on 3.3V). 
That ensures that the average error between the input and DAC output for the LSB is on average 3.25 mV, giving a 400 ns low to high response time (at 2 mV response time).
Adding more bits would only add even more noise, as most ICs only give information for 5mV overdrives in the worst case scenario.
Choosing 8 bits is a good compromise between precision, ease of use and noise.

## PCB Layout

## Sampling Rate


## Temperature Accuracy and Resolutions

# Final Result

## Linearity

## Noise at 150 kHz

## Comparison to MCU


# Sources:

[1] Texas_Instruments-LM311N-NOPB-datasheet.pdf
[2] NTCM-10K-B3380.pdf
[3] esp32_datasheet_en.pdf
