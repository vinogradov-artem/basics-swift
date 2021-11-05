import Foundation


//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.


// MARK: - Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

enum MatErrors: Error {
    case sideAerror(sideA: Int)
    case sideBerror(sideB: Int)

    var localizedDescription: String {
        switch self {
        case .sideAerror (sideA: let sideA):
            return "\(sideA), заданное значение не может быть меньше или равно нулю. "
        case .sideBerror (sideB: let sideB):
            return "\(sideB), заданное значение не может быть меньше или равно нулю. "
        }
    }
}


class Triangle {
    let sideA: Int
    let sideB: Int

    init (sideA: Int, sideB: Int) {
        self.sideA = sideA
        self.sideB = sideB
    }

    func triangleAreaWithError() -> (Int?, MatErrors?) {

        guard sideA > 0 else {
            return (nil, .sideAerror(sideA: sideA))
        }

        guard sideB > 0 else {
            return (nil, .sideBerror(sideB: sideB))
        }

        let area = (sideA * sideB) / 2
        return (area, nil)
    }

    func triangleArea() -> Result<Int, MatErrors> {

        guard sideA > 0 else {
            return .failure(.sideAerror(sideA: sideA))
            }

        guard sideB > 0 else {
            return .failure(.sideBerror(sideB: sideB))
        }

        let area = (sideA * sideB) / 2
        return .success(area)
    }
}


let TriangleOne = Triangle (sideA: 3, sideB: 4).triangleAreaWithError()

if let area = TriangleOne.0 {
    print("Площадь прямоугольного треугольника равна \(area)")
} else if let error = TriangleOne.1 {
    print("Вы ввели неверное значение: \(error)")
}


let TriangleTwo = Triangle (sideA: 3, sideB: 4).triangleArea()

switch TriangleTwo {
case .success(let area):
    print("Площадь прямоугольного треугольника равна \(area)")

case .failure(let error):
    print("Вы ввели неверное значение: \(error)")
}

// MARK: - Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

class Triangle2 {
    let sideA: Int
    let sideB: Int

    init (sideA: Int, sideB: Int) {
        self.sideA = sideA
        self.sideB = sideB
    }

    func triangleArea () throws -> Int {

        guard sideA > 0 else {
            throw MatErrors.sideAerror(sideA: sideA)
        }

        guard sideB > 0 else {
            throw MatErrors.sideBerror(sideB: sideB)
        }

        return (sideA * sideB) / 2
    }
}

do {
    let triangleOne = try Triangle2 (sideA: 3, sideB: 4).triangleArea()
    print ("Площадь прямоугольного треугольника равна \(triangleOne)")

} catch MatErrors.sideAerror(sideA: let sideA) {
    print ("Вы ввели неверное значение: \(sideA), так как значение не может быть меньше или равно 0.")

} catch MatErrors.sideBerror(sideB: let sideB) {
    print ("Вы ввели неверное значение: \(sideB), так как значение не может быть меньше или равно 0.")

} catch let error {
    print(error)
}
