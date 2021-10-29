import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum EngineState {
    case on
    case off
}

enum WindowsState: String {
    case open = "открыто"
    case close = "закрыто"
}

enum DoorsState {
    case open
    case close
}

enum Roof {
    case installed
    case removed
}

enum Trunk {
    case up
    case down
}


class Car {

    let mark: String
    let year: Int
    var km: Double
    var vehicheWeight: Double
    var engineState: EngineState
    var windowsState: WindowsState
    var doorsState: DoorsState

    init(mark: String, year: Int, km: Double, vehicheWeight: Double, engineState: EngineState,
         windowsState: WindowsState, doorsState: DoorsState) {
        self.mark = mark
        self.year = year
        self.km = km
        self.vehicheWeight = vehicheWeight
        self.engineState = engineState
        self.windowsState = windowsState
        self.doorsState = doorsState
    }

    func changeWindowsState(to: WindowsState){}
    func changeEngineState(to: EngineState){}
    func changeDoorsState(to: DoorsState){}

    func printDetail() {
        print(self.windowsState.rawValue)
    }
}

class SportCar: Car {

    var roof: Roof

    init(mark: String, year: Int, km: Double, vehicheWeight: Double, engineState: EngineState,
         windowsState: WindowsState, doorsState: DoorsState, roof: Roof) {
        self.roof = roof

        super.init(mark: mark, year: year, km: km, vehicheWeight: vehicheWeight, engineState: engineState,
                   windowsState: windowsState, doorsState: doorsState)
    }
    func changeRoofState(to: Roof) {

        roof = to
    }

    func alarmOFF() {
        engineState = .on
        windowsState = .open
        doorsState = .open
    }
    func alarmON() {
        engineState = .off
        windowsState = .close
        doorsState = .close
    }
    override func changeWindowsState(to: WindowsState) {
        windowsState = to
    }
    override func changeEngineState(to: EngineState) {
        engineState = to
    }
    override func changeDoorsState(to: DoorsState) {
        doorsState = to
    }
}

class TrunkCar: Car {

    var trunk: Trunk

    init(mark: String, year: Int, km: Double, vehicheWeight: Double, engineState: EngineState,
         windowsState: WindowsState, doorsState: DoorsState, trunk: Trunk) {
        self.trunk = trunk
        super.init(mark: mark, year: year, km: km, vehicheWeight: vehicheWeight, engineState: engineState,
                   windowsState: windowsState, doorsState: doorsState)
    }

    func changeTrunkState(to: Trunk) {
        trunk = to
    }
    override func changeWindowsState(to: WindowsState) {
        windowsState = to
    }
    override func changeEngineState(to: EngineState) {
        engineState = to
    }
    override func changeDoorsState(to: DoorsState) {
        doorsState = to
    }

    override func printDetail() {
        super.printDetail()
        print(self.trunk)
    }
}

var carOne = SportCar (mark: "Lancia Flavia", year: 1992, km: 180_000, vehicheWeight: 1300,
                       engineState: .off, windowsState: .close, doorsState: .close, roof: .removed)
var carTwo = SportCar (mark: "Saab 900", year: 1979, km: 300_000, vehicheWeight: 1100,
                       engineState: .off, windowsState: .open, doorsState: .open, roof: .installed)
var carThree = TrunkCar (mark: "Kamaz", year: 2020, km: 1000, vehicheWeight: 6180,
                         engineState: .off, windowsState: .close, doorsState: .close, trunk: .down)
var carFour = TrunkCar (mark: "MAN", year: 2020, km: 0, vehicheWeight: 7100,
                        engineState: .off, windowsState: .close, doorsState: .close, trunk: .up)



carOne.windowsState.rawValue
carOne.engineState
carOne.doorsState

carOne.alarmOFF()

carOne.windowsState
carOne.engineState
carOne.doorsState

carTwo.roof
carTwo.changeRoofState(to: .removed)
carTwo.roof

carThree.doorsState
carThree.trunk
carThree.changeDoorsState(to: .open)
carThree.changeTrunkState(to: .up)
carThree.doorsState
carThree.trunk

carFour.trunk
carFour.km
carFour.changeTrunkState(to: .down)
carFour.km = 100
carFour.trunk
carFour.km



