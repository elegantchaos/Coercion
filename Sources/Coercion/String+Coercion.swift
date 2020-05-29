// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension StringProtocol {
    public var asInt: Int? { return Int(self) }
    public var asUInt: UInt? { return UInt(self) }
    public var asDouble: Double? { Double(self) }
    public var asString: String? { String(self) }
    public var asDate: Date? { StandardConverter.shared.asDate(self) }
}

extension String: StandardConvertible {
    public var asBool: Bool? { (self as NSString).boolValue }
}
