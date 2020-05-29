// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension Bool: IntConvertible {
    public var asInt: Int? { return self ? 1 : 0 }
}

extension Bool: DoubleConvertible {
    public var asDouble: Double? { return self ? 1.0 : 0.0 }
}

extension Bool: StringConvertible {
    public var asString: String? { return self ? "true" : "false" }
}

extension Bool: BoolConvertible {
    public var asBool: Bool? { return self }
}

