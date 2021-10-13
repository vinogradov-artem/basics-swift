import Foundation

//MARK: -  Решение квадратного уравнения ax2+bx+c=0

let a = 3.0
let b = 12.0
let c = -5.0
let x1: Double
let x2: Double
let discriminant = b * b - 4 * a * c

if discriminant > 0 {
    x1 = -b + sqrt(discriminant) / (2 * a)
    x2 = -b - sqrt(discriminant) / (2 * a)
    print("Уравнение имеет 2 корня: x1 = \(x1), x2 = \(x2)")
} else if (discriminant == 0) {
    x1 = -b / (2 * a)
    print("Уравнение имеет 1 корень: x1 = \(x1)")
} else {
    print("Нет корней")
}

//MARK: - Нахождение периметра, площади и гипотенузы треугольника

let katit1: (Double) = 3
let katit2: (Double) = 4
let hypotenuse = sqrt((Double)(katit1 * katit2) + (Double)(katit2 * katit1))
let perimeter = katit1 + katit2 + hypotenuse
let area = (katit1 * katit2) / 2

//MARK: - Сумма вклада за 5 лет

let depositAmount = 100_000.00
let percent = 12.00
var profit = depositAmount * percent / 100
let depositAmountForTheFirstYear = depositAmount + profit
let DepositAmountForTheSecondYear = depositAmountForTheFirstYear * (percent / 100) + depositAmountForTheFirstYear
let DepositAmountForTheThirdYear = DepositAmountForTheSecondYear * (percent / 100) + DepositAmountForTheSecondYear
let DepositAmountForTheFourthYear = DepositAmountForTheThirdYear * (percent / 100) + DepositAmountForTheThirdYear
let DepositAmountForTheFifthYear = DepositAmountForTheFourthYear * (percent / 100) + DepositAmountForTheFourthYear
print ("Сумма вклада через 5 лет равна",  (DepositAmountForTheFifthYear))
