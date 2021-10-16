import Foundation

//MARK: - Написать функцию, которая определяет, четное число или нет.

func isEvenNumber(number: Int) -> Bool { number % 2 == 0 }


//MARK: - Написать функцию, которая определяет, делится ли число без остатка на 3.

func isNumber(_ number: Int, dividedBy divider: Int) -> Bool {
    return number % divider == 0
}

//MARK: - Создать возрастающий массив из 100 чисел.


var array = [Int]()
for i in 0...99 {
    array.append(i)
}
var otherArray = [0...99]

//MARK: - Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var index = 0
while index < array.count {

    if array[index] % 2 == 0 || array[index] % 3 != 0 {
        array.remove(at: index)
        index -= 1
    }
    index += 1
}
print(array)


//MARK: - Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fiboArray(index: Int) -> [Int] {

    var array = [0,1]
    array = [0,1]

    for index in 2..<index {
       array.append(array[index - 2] + array[index - 1])
    }

    return array
}

print(fiboArray(index: 48))
