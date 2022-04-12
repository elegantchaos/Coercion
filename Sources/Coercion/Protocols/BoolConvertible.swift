// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public protocol BoolConvertible: Convertible {
    var asBool: Bool? { get }
}

public extension Optional where Wrapped: BoolConvertible {
    var asBool: Bool? {
        return self?.asBool
    }
}

public extension BoolConvertible {
    func `as`<T: BoolConvertible>(_ type: T.Type) -> Bool? { asBool }
}
