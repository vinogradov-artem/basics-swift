

import Foundation


enum EngineState: String {
    case on = "заведен"
    case off = "заглушен"
}

enum WindowsState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum DoorsState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum RoofState: String {
    case installed = "установленна"
    case removed = "убрана"
}

enum TrunkState: String {
    case full = "заведен"
    case half = "заглушен"
    case empty = "пустая"
}

protocol Car: class, CustomStringConvertible {

    var mark: String { get }
    var year: Int { get }
    var km: Double { get set }
    var vehicleWeight: Double { get set }
    var engineState: EngineState { get set }
    var windowsState: WindowsState { get set }
    var doorsState: DoorsState { get set }

    func changeWindowsState(to: WindowsState)
    func changeEngineState(to: EngineState)
    func changeDoorsState(to: DoorsState)
}

extension Car {
    func changeWindowsState(to: WindowsState) {
        windowsState = to
    }

    func changeEngineState(to: EngineState) {
        engineState = to
    }

    func changeDoorsState(to: DoorsState) {
        doorsState = to
    }

    var description: String {
        return "Марка автомобиля: \(mark), год выпуска: \(year), пробег: \(km), вес автомобиля: \(vehicleWeight), состояние двигателя: \(engineState.rawValue), состояние окон: \(windowsState.rawValue), состояние дверей: \(doorsState.rawValue)"
    }
}

class SportCar: Car {

    var mark: String
    var year: Int
    var km: Double
    var vehicleWeight: Double
    var engineState: EngineState
    var windowsState: WindowsState
    var doorsState: DoorsState
    var roofState: RoofState

    init(mark: String, year: Int, km: Double, vehicleWeight: Double, engineState: EngineState, windowsState: WindowsState, doorsState: DoorsState, roofState: RoofState) {
        self.mark = mark
        self.year = year
        self.km = km
        self.vehicleWeight = vehicleWeight
        self.engineState = engineState
        self.windowsState = windowsState
        self.doorsState = doorsState
        self.roofState = roofState
    }

    func changeRoofState(to: RoofState) {
        roofState = to
    }

}

class TruncCar: Car {

    let mark: String
    var year: Int
    var km: Double
    var vehicleWeight: Double
    var engineState: EngineState
    var windowsState: WindowsState
    var doorsState: DoorsState
    var trunkState: TrunkState

    func changeYear(to newYear: Int) {
        self.year = newYear
    }

    init(mark: String,
         year: Int,
         km: Double,
         vehicleWeight: Double,
         engineState: EngineState,
         windowsState: WindowsState,
         doorsState: DoorsState,
         trunkState: TrunkState) {
        self.mark = mark
        self.year = year
        self.km = km
        self.vehicleWeight = vehicleWeight
        self.engineState = engineState
        self.windowsState = windowsState
        self.doorsState = doorsState
        self.trunkState = trunkState
    }

    func changeTrunkState(to: TrunkState) {
            trunkState = to
    }

}
    extension SportCar {
        var description: String {
            return "Марка автомобиля: \(mark), год выпуска: \(year), пробег: \(km), вес автомобиля: \(vehicleWeight), состояние двигателя: \(engineState.rawValue), состояние окон: \(windowsState.rawValue), состояние дверей: \(doorsState.rawValue), состояние крыши: \(roofState.rawValue)"
        }
    }

    extension TruncCar {
        var description: String {
            "Марка автомобиля: \(mark), год выпуска: \(year), пробег: \(km), вес автомобиля: \(vehicleWeight), состояние двигателя: \(engineState.rawValue), состояние окон: \(windowsState.rawValue), состояние дверей: \(doorsState.rawValue), состояние багажника: \(trunkState.rawValue)"
        }
    }

var carOne = SportCar(mark: "Toyota", year: 2020, km: 0, vehicleWeight: 1200, engineState: .off, windowsState: .close, doorsState: .close, roofState: .removed)

var carTwo = SportCar(mark: "ford", year: 2016, km: 105000, vehicleWeight: 1350, engineState: .on, windowsState: .close, doorsState: .open, roofState: .installed)

var carThree = TrunkState(mark: "Kamaz", year: 2008, km: 25000, vehicleWeight: 6000, engineState: .off, windowsState: .close, doorsState: .close, trunkState: .empty)

var carFour = TrunkState(mark: "Kamaz", year: 2008, km: 25000, vehicleWeight: 6000, engineState: .off, windowsState: .close, doorsState: .close, trunkState: .full)

