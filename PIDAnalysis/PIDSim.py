import matplotlib.pyplot as plt
import collections

def clamp(valIn, valMin, valMax):
    return max(min(valIn, valMax), valMin)

class System:
    def __init__(self, temperature, volume, specificHeat):
        self.temperatures = [temperature]
        self.temperature = temperature
        self.specificHeat = specificHeat
        self.volume = volume

    def setController(self, controller):
        self.controller = controller

    def setResponse(self, response):
        self.response = response

    def setTemperature(self, temperature):
        self.temperature = temperature

    def getTemperature(self):
        return self.temperature

    def getDelayedTemperature(self, delay):
        if (delay < len(self.temperatures)):
            return self.temperatures[-(delay+1)]
        else:
            return self.temperatures[0]

    def initSystem(self, initSteps):
        for i in range(initSteps):
            self.temperatures.append(self.temperature)
            self.controller.step(self.getDelayedTemperature(controllerDelay))

    def updateSystem(self, controllerDelay):
        self.temperature += (self.response.getResponse(self.getTemperature()))/(self.specificHeat*self.volume)
        self.temperatures.append(self.temperature)
        self.controller.step(self.getDelayedTemperature(controllerDelay))

class SystemResponse:
    def setCooler(self, cooler):
        self.cooler = cooler

    def setController(self, controller):
        self.controller = controller

    def setConvection(self, convection):
        self.convection = convection

    def getResponse(self, temperature):
        coolerResponse = -self.cooler.getPower(clamp(self.controller.getResponse(),0,1))
        convectionResponse = self.convection.getPower(temperature)
        return coolerResponse + convectionResponse

class Convection:
    def __init__(self, roomTemperature, area, heatTransferRate):
        self.roomTemperature = roomTemperature
        self.area = area
        self.heatTransferRate = heatTransferRate

    def getPower(self, curTemperature):
        return (self.roomTemperature - curTemperature)*self.area*self.heatTransferRate

class Controller:
    def __init__(self, target, P, I, D, IWindow):
        self.P = P
        self.I = I
        self.D = D
        self.IWindow = IWindow
        self.target = target

        self.totError = 0
        self.errors = collections.deque([])

    def getResponse(self):
        return clamp(self.P*self.errors[-1] + self.I*self.totError + self.D*(self.errors[-1] - self.errors[-2]),-1,1)

    def step(self, newTemp):
        self.errors.append(newTemp - self.target)
        self.totError += self.errors[-1]
        if len(self.errors) > self.IWindow:
            self.totError -= self.errors[0]
            self.errors.popleft()

    def printErrors(self):
        print(self.errors[-1], self.totError, self.errors[-1] - self.errors[-2])

class heatPump:
    def __init__(self, power):
        self.power = power

    def getPower(self, response):
        return self.power*response

class ShittyCoolingRelay:
    def __init__(self, minPower, maxPower):
        self.minPower = minPower
        self.maxPower = maxPower

    def getPower(self, response):
        return (self.maxPower - self.minPower) * response + self.minPower

#System variables
roomTemperature = 21 #Assumed to be constant
heatTransferRate = 50
area = 0.1*0.1*3.14 #MeasureBucket
volume = 10
coolingEfficiency = 0.15
minCoolingPower = 5*5 #This has to be the effective cooling power
maxCoolingPower = 12*5 #This has to be the effective cooling power
specificHeat = 4184
controllerDelay = 1000 #Delay in seconds

targetTemp = 18
P = 1
I = 0.0015
D = -0.1

IWindow = 1024

simulationTime = 50000 #Total simulation time in seconds

sys = System(roomTemperature, volume, specificHeat)
cooler = ShittyCoolingRelay(minCoolingPower*coolingEfficiency,maxCoolingPower*coolingEfficiency)

controller = Controller(targetTemp, P, I, D, IWindow)
convection = Convection(roomTemperature, area, heatTransferRate)

response = SystemResponse()
response.setCooler(cooler)
response.setConvection(convection)
response.setController(controller)

sys.setResponse(response)
sys.setController(controller)

temperatures = []
events = []
eventIndex = 0
sys.initSystem(2)
for i in range(simulationTime):
    temperatures.append(sys.getTemperature())
    sys.updateSystem(controllerDelay)
    if eventIndex < len(events) and events[eventIndex][0] == i:
        sys.setTemperature(events[eventIndex][1])
        eventIndex += 1

plt.plot(temperatures)
plt.axhline(y=targetTemp, color='r', linestyle='--', label='Target Temp')
plt.show()
