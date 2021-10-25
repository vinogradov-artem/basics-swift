import Foundation


struct SportCar {
    let carBrand: String
    let yearOfRelease: Int
    let trunkVolume: Double
    var engineRunning: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Double

    enum Action {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case fillTrunk(cargoVolume: Double)
        case emptyTrunk(cargoVolume: Double)
    }

    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            engineRunning = true
            print("Двигатель запущен")
        case .stopEngine:
            engineRunning = false
            print("Двигатель заглушен")
        case .openWindow:
            windowsIsOpen = true
            print("Окна открыты")
        case .closeWindow:
            windowsIsOpen = false
            print("Окна закрыты")
        case .fillTrunk(let cargoVolume):
            if cargoVolume <= (trunkVolume - filledTrunkVolume) {
                filledTrunkVolume += cargoVolume
                print("Багажник загружен: \(filledTrunkVolume) л")
            } else {
                print("Объем багажника не позволяет поместить весь груз. Заполненный объем: \(trunkVolume - filledTrunkVolume)")
            }
        case .emptyTrunk(let cargoVolume):
            if cargoVolume <= filledTrunkVolume {
                print("Недостаточное количество груза в багажнике")
            } else {
                filledTrunkVolume -= cargoVolume
                print("Багажник разгружен")
            }
        }
    }

    func printInfo() {
        print("Марка авто: \(self.carBrand)")
        print("Год выпуска: \(self.yearOfRelease)")
        print("Объем багажника: \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineRunning ? "Запущен" : "Заглушен")")
        print("Положение окон: \(self.windowsIsOpen ? "Открыты" : "Закрыты")")
        print("Загрузка багажника: \(self.trunkVolume)")
    }
}

var lancia = SportCar(carBrand: "lancia",
                    yearOfRelease: 2020,
                    trunkVolume: 300,
                    engineRunning: true,
                    windowsIsOpen: true,
                    filledTrunkVolume: 100)

lancia.printInfo()
lancia.makeAction(action: .closeWindow)
lancia.makeAction(action: .fillTrunk(cargoVolume: 50))
lancia.makeAction(action: .fillTrunk(cargoVolume: 200))
print(lancia.filledTrunkVolume)

var subaru = SportCar(carBrand: "subaru",
                     yearOfRelease: 2021,
                     trunkVolume: 500,
                     engineRunning: false,
                     windowsIsOpen: false,
                     filledTrunkVolume: 0)

subaru.printInfo()
subaru.makeAction(action: .startEngine)
subaru.makeAction(action: .fillTrunk(cargoVolume: 200))
subaru.makeAction(action: .fillTrunk(cargoVolume: 200))
print(subaru.filledTrunkVolume)

var nissan = SportCar(carBrand: "nissan",
                      yearOfRelease: 2019,
                      trunkVolume: 400,
                      engineRunning: true,
                      windowsIsOpen: false,
                      filledTrunkVolume: 0)

nissan.printInfo()
nissan.makeAction(action: .startEngine)
nissan.makeAction(action: .closeWindow)
nissan.makeAction(action: .fillTrunk(cargoVolume: 200))
nissan.makeAction(action: .fillTrunk(cargoVolume: 300))
print(nissan.filledTrunkVolume)

//MARK:-

struct TrunkCar {
    let carBrand: String
    let yearOfRelease: Int
    let bodyVolume: Double
    var engineRunning: Bool
    var windowsIsOpen: Bool
    var filledBodyVolume: Double

    enum Action {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case fillBody(cargoVolume: Double)
        case emptyBody(cargoVolume: Double)
    }

    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            engineRunning = true
            print("Двигатель запущен")
        case .stopEngine:
            engineRunning = false
            print("Двигатель заглушен")
        case .openWindow:
            windowsIsOpen = true
            print("Окна открыты")
        case .closeWindow:
            windowsIsOpen = false
            print("Окна закрыты")
        case .fillBody(let cargoVolume):
            if cargoVolume <= (bodyVolume - filledBodyVolume) {
                filledBodyVolume += cargoVolume
                print("Багажник загружен: \(filledBodyVolume) л")
            } else {
                print("Объем багажника не позволяет поместить весь груз. Заполненный объем: \(bodyVolume - filledBodyVolume)")
            }
        case .emptyBody(let cargoVolume):
            if cargoVolume <= filledBodyVolume {
                print("Недостаточное количество груза в багажнике")
            } else {
                filledBodyVolume -= cargoVolume
                print("Багажник разгружен")
            }
        }
    }

    func printInfo() {
        print("Марка авто: \(self.carBrand)")
        print("Год выпуска: \(self.yearOfRelease)")
        print("Объем багажника: \(self.bodyVolume)")
        print("Состояние двигателя: \(self.engineRunning ? "Запущен" : "Заглушен")")
        print("Положение окон: \(self.windowsIsOpen ? "Открыты" : "Закрыты")")
        print("Загрузка багажника: \(self.bodyVolume)")
    }
}

var ural = TrunkCar(carBrand: "ural",
                    yearOfRelease: 2020,
                    bodyVolume: 3000,
                    engineRunning: true,
                    windowsIsOpen: true,
                    filledBodyVolume: 0)

ural.printInfo()
ural.makeAction(action: .closeWindow)
ural.makeAction(action: .fillBody(cargoVolume: 2000))
ural.makeAction(action: .fillBody(cargoVolume: 3010))
print(ural.filledBodyVolume)

var liaz = TrunkCar(carBrand: "liaz",
                     yearOfRelease: 2021,
                     bodyVolume: 1200,
                     engineRunning: false,
                     windowsIsOpen: false,
                     filledBodyVolume: 0)

liaz.printInfo()
liaz.makeAction(action: .startEngine)
liaz.makeAction(action: .fillBody(cargoVolume: 200))
liaz.makeAction(action: .fillBody(cargoVolume: 800))
print(liaz.filledBodyVolume)

var iveco = TrunkCar(carBrand: "iveco",
                     yearOfRelease: 2019,
                     bodyVolume: 1300,
                     engineRunning: true,
                     windowsIsOpen: false,
                     filledBodyVolume: 0)

iveco.printInfo()
iveco.makeAction(action: .stopEngine)
iveco.makeAction(action: .fillBody(cargoVolume: 350))
iveco.makeAction(action: .fillBody(cargoVolume: 750))
print(iveco.filledBodyVolume)
