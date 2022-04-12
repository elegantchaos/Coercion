// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public protocol UIntConvertible: Convertible {
    var asUInt: UInt? { get }
}

public extension Optional where Wrapped: UIntConvertible {
    var asUInt: UInt? {
        return self?.asUInt
    }
}

public extension UIntConvertible {
    func `as`<T: UIntConvertible>(_ type: T.Type) -> UInt? { asUInt }
}

