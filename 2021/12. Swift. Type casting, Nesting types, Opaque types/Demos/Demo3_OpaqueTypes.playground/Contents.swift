import Foundation

protocol CalculationsProtocol {
    func calculateResult() -> Int
}

struct BaseRecord: CalculationsProtocol {
    let a: Int
    
    func calculateResult() -> Int {
        return a * 3
    }
}

struct ComplexRecord<T: CalculationsProtocol>: CalculationsProtocol {
    let x: T
    
    func calculateResult() -> Int {
        return x.calculateResult()
    }
}

struct SummaryRecord<T: CalculationsProtocol, U: CalculationsProtocol>: CalculationsProtocol {
    let firstRecord: T
    let secondRecord: U
    
    func calculateResult() -> Int {
        return firstRecord.calculateResult() + secondRecord.calculateResult()
    }
}

class Calculator {
    func getSummaryResult() -> some CalculationsProtocol {
        let baseRecord = BaseRecord(a: 23)
        let complexRecord = ComplexRecord<BaseRecord>(x: baseRecord)
        let summaryRecord = SummaryRecord<ComplexRecord, BaseRecord>(firstRecord: complexRecord,
                                                                     secondRecord: baseRecord)
        return summaryRecord
//        if Calendar.current.isDateInWeekend(Date()) {
//            return complexRecord
//        } else {
//            return summaryRecord
//        }
    }
    
    func getArray<T: CalculationsProtocol>(record: T) -> some Collection {
        return Array<T>(repeating: record, count: 3)
    }
}

let sumRecord = Calculator().getSummaryResult()
Calculator().getArray(record: BaseRecord(a: 5))
print("\(sumRecord.calculateResult())")
