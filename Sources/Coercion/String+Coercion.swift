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
    public func asDate(using formatter: DateFormatter) -> Date? { formatter.date(from: String(self)) }
}

extension NSString: StandardConvertible {
    public var asInt: Int? { integerValue }
    public var asDouble: Double? { doubleValue }
    public var asUInt: UInt? { UInt(integerValue) }
    public var asBool: Bool? { boolValue }
    public func asDate(using formatter: DateFormatter) -> Date? { formatter.date(from: self as String) }
}

extension String: StandardConvertible {
    public var asBool: Bool? { (self as NSString).boolValue }
}

extension String: DateStringConvertible { }

extension String: DataConvertible {
    public var asData: Data? { return data(using: .utf8) }
}
