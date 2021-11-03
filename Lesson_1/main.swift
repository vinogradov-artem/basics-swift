import Foundation

enum Gender: String {
    case male = "мужской"
    case female = "женский"
}

class Profile {
    let gender: Gender
    let name: String
    let age: Int

    init(gender: Gender, name: String, age: Int) {
        self.gender = gender
        self.name = name
        self.age = age
    }
}

extension Profile {
    var toText: String {
    "Пол: \(gender.rawValue). Имя: \(name). Возраст: \(age)"
    }
}

struct Queue<T> {
    private var elements: [T] = []

    func filter(predicate: (T) -> Bool) -> [T] {
        var tempArray: [T] = []
        for element in elements {
            if predicate(element) {
                tempArray.append(element)
            }
        }
        return tempArray
    }

    mutating func push (_ element: T) {
        elements.append(element)
    }


    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}

extension Queue {

    subscript(index: Int) -> T? {
        guard index >= 0 && index < elements.count else {
            return nil
        }
        return elements[index]
    }
}



var profiles = Queue<Profile>()

profiles.push(Profile(gender: .male, name: "Евгений", age: 31))
profiles.push(Profile(gender: .female, name: "Анна", age: 4))
profiles.push(Profile(gender: .female, name: "Алина", age: 9))
profiles.push(Profile(gender: .female, name: "Ксения", age: 30))
profiles.push(Profile(gender: .male, name: "Артем", age: 31))

var filterProfiles = profiles.filter { element in element.age > 18 }
filterProfiles.forEach { print($0.toText) }

profiles[3]



