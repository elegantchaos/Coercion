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
}

extension String: IntConvertible { }
extension String: UIntConvertible { }
extension String: DoubleConvertible { }
extension String: StringConvertible { }
extension String: BoolConvertible {
    public var asBool: Bool? { (self as NSString).boolValue }
}
