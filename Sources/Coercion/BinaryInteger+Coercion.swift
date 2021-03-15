// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation


extension BinaryInteger {
    public var asInt: Int? { Int(self) }
    public var asUInt: UInt? { UInt(self) }
    public var asDouble: Double? { Double(self) }
    public var asBool: Bool? { self == 0 ? false : true }
    public var asString: String? { self.description }
    public var asDate: Date? { Date(timeIntervalSinceReferenceDate: Double(self)) }
}

extension Int: StandardConvertible { }
extension Int8: StandardConvertible { }
extension Int16: StandardConvertible { }
extension Int32: StandardConvertible { }
extension Int64: StandardConvertible { }

extension UInt: StandardConvertible { }
extension UInt8: StandardConvertible { }
extension UInt16: StandardConvertible { }
extension UInt32: StandardConvertible { }
extension UInt64: StandardConvertible { }

extension CFBoolean: IntConvertible {
    public var asInt: Int? { self == kCFBooleanTrue ? 1 : 0 }
}
extension NSNumber: IntConvertible {
    public var asInt: Int? { Int(int64Value) }
}

extension CFBoolean: UIntConvertible {
    public var asUInt: UInt? { self == kCFBooleanTrue ? 1 : 0 }
}
extension NSNumber: UIntConvertible {
    public var asUInt: UInt? { UInt(int64Value) }
}
