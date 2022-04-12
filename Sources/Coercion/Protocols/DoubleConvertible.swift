// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public protocol DoubleConvertible: Convertible {
    var asDouble: Double? { get }
}

public extension Optional where Wrapped: DoubleConvertible {
    var asDouble: Double? {
        return self?.asDouble
    }
}

public extension DoubleConvertible {
    func `as`<T: DoubleConvertible>(_ type: T.Type) -> Double? { asDouble }
}

