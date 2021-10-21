
//: ## Swift: Generics

//: [WWDC 2016: Getting started with Swift](https://developer.apple.com/videos/play/wwdc2016/404/)
//:
//: [Swift docs: Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

//: ### Generic Function
//:
//: Измените функцию так, чтобы она возвращала наименьшее значение из массива `items`.

func lowest<T: Comparable>(_ items: [T]) -> T? {
    items.min()
}

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

struct OrderedQueue<T: Hashable & Comparable> {
    
    var items: Set<T>
    
    mutating func dequeue() -> T? { self.items.min() }
    
}

//: ### `associatedtype`
//:
//: Произведите рефакторинг кода, применяя знания об `associatedtype`, для классов, описанных ниже.
//:
protocol Id {
    associatedtype Id
    var id: Id { get }
}

protocol Items {
    associatedtype Item: Id
    var items: [Item] { get }
}



class Passenger: Id {
    var id: String = ""
}

class Container: Id {
    var id: String = ""
}

class Van: Id {
    var id: String = ""
}

class Airbus: Items {
    var items: [Passenger] = []
}

class Train: Items {
    var items: [Van] = []
}

class Seaship: Items {
    var items: [Container] = []
}


//: ### `where`
//:
//: Для типа `OrderedQueue`, описанного выше, добавьте расширения с условиями:
//:
//: 1. Если тип `T` представлен числовым типом, в интерфейсе доступно свойство `count`, возвращающее количество элементов
//: 2. Если тип `T` представлен строковым типом, в интерфейсе доступен метод `prefix`, возвращающий наибольший общий префикс у всех элементов

extension OrderedQueue where T: Numeric {
    func count() -> Int {
        return self.items.count
    }
}

extension OrderedQueue where T == String {
    func prefix(_ length: Int) -> [T] {
        return Array(self.items.dropFirst(length - 1))
    }
}


var test = OrderedQueue(items: ["one", "two"])
var test1 = OrderedQueue(items: [1, 2, 3])
test.prefix(1)
