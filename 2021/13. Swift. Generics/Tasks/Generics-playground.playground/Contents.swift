
//: ## Swift: Generics

//: [WWDC 2016: Getting started with Swift](https://developer.apple.com/videos/play/wwdc2016/404/)
//:
//: [Swift docs: Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

//: ### Generic Function
//:
//: Измените функцию так, чтобы она возвращала наименьшее значение из массива `items`.

func lowest<T>(_ items: [T]) -> T? { nil }

let items: [Int] = (0...10).compactMap { (-200...($0 * 100)).randomElement() }

print(items.sorted())

if let value = lowest(items) {
    print(value)
}

//: ### Generic Type
//:
//: Определите реализацию типа `OrderedQueue`, используя знания о Generic, таким образом, чтобы:
//: 1. Элементы хранились в контейнере типа `Set`
//: 2. Метод `dequeue` извлекал минимальный элемент

struct OrderedQueue<T> {
    
    var items: [T]
    
    mutating func dequeue() -> T? { nil }
    
}

//: ### `associatedtype`
//:
//: Произведите рефакторинг кода, применяя знания об `associatedtype`, для классов, описанных ниже.
//:

class Passenger {
    var id: String = ""
}

class Container {
    var id: String = ""
}

class Van {
    var id: String = ""
}

class Airbus {
    var items: [Passenger] = []
}

class Train {
    var items: [Van] = []
}

class Seaship {
    var items: [Container] = []
}


//: ### `where`
//:
//: Для типа `OrderedQueue`, описанного выше, добавьте расширения с условиями:
//:
//: 1. Если тип `T` представлен числовым типом, в интерфейсе доступно свойство `count`, возвращающее количество элементов
//: 2. Если тип `T` представлен строковым типом, в интерфейсе доступен метод `prefix`, возвращающий наибольший общий префикс у всех элементов

extension OrderedQueue {
    
}

extension OrderedQueue {
    
}
