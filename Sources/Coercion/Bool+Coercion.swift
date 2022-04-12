// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension Bool: StandardConvertible {
    public var asInt: Int? { return self ? 1 : 0 }
    public var asUInt: UInt? { return self ? 1 : 0 }
    public var asDouble: Double? { return self ? 1.0 : 0.0 }
    public var asString: String? { return self ? "true" : "false" }
    public var asBool: Bool? { return self }
}

extension NSNumber: BoolConvertible {
    public var asBool: Bool? { self.boolValue }
}

#if !os(Linux)
extension CFBoolean: StandardConvertible {
    public var asBool: Bool? { self == kCFBooleanTrue }
}
#endif
