// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

// TODO: move to standalone package

public class Coercion {
    class func asString(_ value: Any?) -> String? {
        guard let value = value else { return nil }
        
        if let string = value as? String {
            return string
        }
        
        return String(describing: value)
    }

    class func asInt<T>(_ value: T?) -> Int? where T: IntConvertable {
        return value?.asInt
    }
    
    class func asInt(_ value: Any?) -> Int? {
        guard let value = value else { return nil }
        return (value as? IntConvertable)?.asInt
    }

    class func asDouble(_ value: Any?) -> Double? {
        guard let value = value else { return nil }

        if let double = value as? Double {
            return double
        }

        if let int = value as? Int {
            return Double(int)
        }

        
        if let bool = value as? Bool {
            return bool ? 1.0 : 0.0
        }
        
        if let string = value as? String {
            return Double(string)
        }
        
        return nil
    }

    static var dateFormatter = ISO8601DateFormatter()
    
    class func asDate(_ value: Any?) -> Date? {
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

