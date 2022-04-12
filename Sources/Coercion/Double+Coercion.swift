// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension BinaryFloatingPoint {
    public var asInt: Int? { Int(self) }
    public var asUInt: UInt? { UInt(self) }
    public var asDouble: Double? { Double(self) }
    public var asBool: Bool? { self == 0.0 ? false : true }
    public var asDate: Date? { Date(timeIntervalSinceReferenceDate: Double(self)) }
}

extension Double: StandardConvertible { }
extension Float: StandardConvertible { }

extension NSNumber: DoubleConvertible {
    public var asDouble: Double? { doubleValue }
}

extension NSNumber: StandardConvertible {
    
}

#if !os(Linux)
extension CFBoolean: DoubleConvertible {
    public var asDouble: Double? { self == kCFBooleanTrue ? 1.0 : 0.0 }
}
#endif
