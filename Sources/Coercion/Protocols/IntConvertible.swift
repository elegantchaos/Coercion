// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public protocol IntConvertible: Convertible {
    var asInt: Int? { get }
}

public extension Optional where Wrapped: IntConvertible {
    var asInt: Int? {
        return self?.asInt
    }
}

public extension IntConvertible {
    func `as`<T: IntConvertible>(_ type: T.Type) -> Int? { asInt }
}
