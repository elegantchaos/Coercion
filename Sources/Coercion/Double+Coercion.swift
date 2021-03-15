// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension Double: IntConvertible {
    public var asInt: Int? { Int(self) }
}

extension Double: UIntConvertible {
    public var asUInt: UInt? { UInt(self) }
}

extension Double: DoubleConvertible {
    public var asDouble: Double? { self }
}

extension Double: BoolConvertible {
    public var asBool: Bool? { self == 0.0 ? false : true }
}

extension Double: StringConvertible { }

extension Double: DateConvertible {
    public var asDate: Date? { Date(timeIntervalSinceReferenceDate: self) }
}

extension NSNumber: DoubleConvertible {
    public var asDouble: Double? { doubleValue }
}

extension CFBoolean: DoubleConvertible {
    public var asDouble: Double? { self == kCFBooleanTrue ? 1.0 : 0.0 }
}
