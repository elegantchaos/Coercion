// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public protocol Convertible {
    func `as`<T>(_ type: T.Type) -> T?
}

public extension Optional where Wrapped: Convertible {
    func `as`<T>(_ type: T.Type) -> T? {
        self?.as(type)
    }
}

public protocol StandardConvertible: IntConvertible, UIntConvertible, DoubleConvertible, BoolConvertible, StringConvertible {
}

public extension Convertible {
    func `as`<T>(_ type: T.Type) -> T? {
        return nil
    }
}
