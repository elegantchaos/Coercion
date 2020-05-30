// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

// TODO: move to standalone package


public protocol Converter {
    func asString<T>(_ value: T?) -> String? where T: StringConvertible
    func asString(_ value: Any?) -> String?
    func asInt<T>(_ value: T?) -> Int? where T: IntConvertible
    func asInt(_ value: Any?) -> Int?
    func asUInt<T>(_ value: T?) -> UInt? where T: UIntConvertible
    func asUInt(_ value: Any?) -> UInt?
    func asDouble<T>(_ value: T?) -> Double? where T: DoubleConvertible
    func asDouble(_ value: Any?) -> Double?
    func asDate(_ value: Any?) -> Date?
}

public protocol DateFormatter {
    func date(from string: String) -> Date?
}

public struct StandardConverter: Converter {
    public static let shared = StandardConverter()
    var dateFormatter = ISO8601DateFormatter()
    
    public func asString<T>(_ value: T?) -> String? where T: StringConvertible {
        return value?.asString
    }
    
    public func asString(_ value: Any?) -> String? {
        if let value = value as? StringConvertible {
            return value.asString
        } else if let value = value {
            return String(describing: value)
        } else {
            return nil
        }
    }

    public func asInt<T>(_ value: T?) -> Int? where T: IntConvertible {
        return value?.asInt
    }
    
    public func asInt(_ value: Any?) -> Int? {
        guard let value = value as? IntConvertible else { return nil }
        return value.asInt
    }

    public func asUInt<T>(_ value: T?) -> UInt? where T: UIntConvertible {
        return value?.asUInt
    }
    
    public func asUInt(_ value: Any?) -> UInt? {
        guard let value = value as? UIntConvertible else { return nil }
        return value.asUInt
    }

    public func asDouble<T>(_ value: T?) -> Double? where T: DoubleConvertible {
        return value?.asDouble
    }
    
    public func asDouble(_ value: Any?) -> Double? {
        guard let value = value as? DoubleConvertible else { return nil }
        return value.asDouble
    }

    public func asDate(_ value: Any?) -> Date? {
        if let value = value as? DateStringConvertible {
            return value.asDate(using: dateFormatter)
        } else if let value = value as? DateConvertible {
            return value.asDate
        } else {
            return nil
        }
    }
}

