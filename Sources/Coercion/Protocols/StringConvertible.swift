// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public protocol StringConvertible: Convertible {
    var asString: String? { get }
}

public extension Optional where Wrapped: StringConvertible {
    var asString: String? {
        return self?.asString
    }
}

public extension Optional where Wrapped: CustomStringConvertible {
    var asString: String? {
        return self == nil ? nil : self?.description
    }
}

public extension CustomStringConvertible {
    var asString: String? {
        return self.description
    }
}

public extension StringConvertible {
    func `as`<T: StringConvertible>(_ type: T.Type) -> String? { asString }
}
