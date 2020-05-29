// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

protocol StandardConversions: IntConvertible, UIntConvertible, DoubleConvertible, BoolConvertible, StringConvertible {
}

extension BinaryInteger {
    public var asInt: Int? { Int(self) }
    public var asUInt: UInt? { UInt(self) }
    public var asDouble: Double? { Double(self) }
    public var asBool: Bool? { self == 0 ? false : true }
    public var asString: String? { self.description }
}

extension Int: StandardConversions { }
extension Int8: StandardConversions { }
extension Int16: StandardConversions { }
extension Int32: StandardConversions { }
extension Int64: StandardConversions { }

extension UInt: StandardConversions { }
extension UInt8: StandardConversions { }
extension UInt16: StandardConversions { }
extension UInt32: StandardConversions { }
extension UInt64: StandardConversions { }

//
//extension Int: DoubleConvertible {
//    public var asDouble: Double? { Double(self) }
//}
//
//extension Int: BoolConvertible {
//    public var asBool: Bool? { self == 0 ? false : true }
//}
//
//extension Int: StringConvertible { }
//
