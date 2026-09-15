## PID Simulation

The simulation follows a model where the bucket has a certain amount of volume, and with an effective cooling rate derived from the data sheet of the Pelteir cooler.
Then we have a time delay for the water to reach the temperature sensor to simulate heat spreading through the water.

![ESPPID.png](ESPPID.png)

We tested the PID values on a ESP using a software approach (not the FPGA) first using values from the simulation.
We can see that the PID controller is able to maintain the temperature within a certain range, but there is some limited overshoot. 
This is partly due to the innacuracy of the PID values, but we also underestimated the time delay of the water to reach the temperature sensor.
Unfortunately we did not have enough time in the course to do another overnight PID test, but we can see that the PID values are working respectably. 
As stated in the other READMEs, the relay noise meant that we could not test the FPGA based approach.

## Post Mortem
For the next iteration, we should measure the system constant more accurately to improve the simulation. 
Additionally, we should dedicate more time to testing and validating our simulations.
