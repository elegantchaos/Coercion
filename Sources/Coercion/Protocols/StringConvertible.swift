// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public protocol StringConvertible {
    var asString: String? { get }
}

extension Optional where Wrapped: StringConvertible {
    public var asString: String? {
        return self?.asString
    }
}

extension CustomStringConvertible {
    public var asString: String? {
        return self.description
    }
}
