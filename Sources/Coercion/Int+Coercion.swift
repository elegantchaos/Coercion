// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension Int: IntConvertible {
    public var asInt: Int? { self }
}

extension Int: DoubleConvertible {
    public var asDouble: Double? { Double(self) }
}

extension Int: BoolConvertible {
    public var asBool: Bool? { self == 0 ? false : true }
}

extension Int: StringConvertible {
}
