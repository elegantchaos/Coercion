// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

// TODO: move to standalone package

public struct Converter {
    public static let shared = Converter()

    let dateFormatter = ISO8601DateFormatter()
    
    func asString<T>(_ value: T?) -> String? where T: StringConvertible {
        return value?.asString
    }
    
    func asString<T>(_ value: T?) -> String? where T: CustomStringConvertible {
        return value?.description
    }
    
    func asString(_ value: Any?) -> String? {
        if let value = value as? StringConvertible { return value.asString }
        return String(describing: value)
    }

    func asInt<T>(_ value: T?) -> Int? where T: IntConvertible {
        return value?.asInt
    }
    
    func asInt(_ value: Any?) -> Int? {
        guard let value = value as? IntConvertible else { return nil }
        return value.asInt
    }

    func asDouble<T>(_ value: T?) -> Double? where T: DoubleConvertible {
        return value?.asDouble
    }
    
    func asDouble(_ value: Any?) -> Double? {
        guard let value = value as? DoubleConvertible else { return nil }
        return value.asDouble
    }

    func asDate(_ value: Any?) -> Date? {
        guard let value = value else { return nil }

        if let date = value as? Date {
            return date
        }
        
        if let double = value as? Double {
            return Date(timeIntervalSinceReferenceDate: double)
        }

        if let int = value as? Int {
            return Date(timeIntervalSinceReferenceDate: TimeInterval(int))
        }

        if let string = value as? String {
            return dateFormatter.date(from: string)
        }
        
        return nil
    }
}

