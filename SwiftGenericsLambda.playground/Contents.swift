import UIKit
import Foundation
struct CountedSet<Element: Hashable> {
    private(set) var storage = [Element:Int]()
}
extension CountedSet {
    mutating func insert(element: Element) {
        storage[element] = (storage[element] ?? 0) + 1
    }
    
    mutating func remove(_ element: Element) {
        let count = (storage[element] ?? 0)
        if count > 0 {
            storage[element] = count - 1
        }
    }
}
extension CountedSet {
    subscript(_ member: Element) -> Int {
        return storage[member] ?? 0
    }
}
extension CountedSet {
    var count: Int? {
        if storage.count == 0 {
            return nil
        }
        return storage.count
    }
}
extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    init(arrayLiteral elements: Element...) {
        for element in elements {
            storage[element] = (storage[element] ?? 0) + 1
        }
    }
}

enum Arrow {
    case iron
    case magic
    case silver
    case dwarvish
}

let aCountedSet = CountedSet<Arrow>()
var myCountedArrowSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

myCountedArrowSet[.iron]
myCountedArrowSet.remove(.iron)
myCountedArrowSet[.iron]

myCountedArrowSet[.magic]
myCountedArrowSet.remove(.magic)
myCountedArrowSet[.magic]

myCountedArrowSet[.silver]
myCountedArrowSet.remove(.silver)
myCountedArrowSet[.silver]
