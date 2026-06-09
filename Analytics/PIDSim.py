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

    def setHeater(self, heater):
        self.heater = heater

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
        self.temperature += (self.controller.getResponse()*self.heater.getPower())/(self.specificHeat*self.volume)
        self.temperatures.append(self.temperature)
        self.controller.step(self.getDelayedTemperature(controllerDelay))

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

    def printIError(self):
        print(self.totError)

class Heater:
    def __init__(self, power):
        self.power = power

    def getPower(self):
        return self.power
#Convection
#System variables
initTemp = 21
volume = 10
heatingPower = -13 #This has to be the effective heating power
specificHeat = 4184
controllerDelay = 1000 #Delay in seconds

targetTemp = 18
P = 0.01
I = 0.001
D = 0.001

IWindow = 1000

simulationTime = 100000 #Total simulation time in seconds

sys = System(initTemp, volume, specificHeat)
heater = Heater(heatingPower)

controller = Controller(targetTemp, P, I, D, IWindow)

sys.setHeater(heater)
sys.setController(controller)

temperatures = []
sys.initSystem(5)
for i in range(simulationTime):
    temperatures.append(sys.getTemperature())
    sys.updateSystem(controllerDelay)
    controller.printIError()

plt.plot(temperatures)
plt.show()