// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public protocol DateConvertible: Convertible {
    var asDate: Date? { get }
}

public extension Optional where Wrapped: DateConvertible {
    var asDate: Date? {
        return self?.asDate
    }
}

public extension DateConvertible {
    func `as`<T: DateConvertible>(_ type: T.Type) -> Date? {
        asDate
    }
}

public protocol DateStringConvertible: DateConvertible {
    func asDate(using: DateFormatter) -> Date?
}

public extension DateStringConvertible {
    var asDate: Date? { asDate(using: StandardConverter.shared.dateFormatter) }
    func `as`<T: DateConvertible>(_ type: T.Type) -> Date? { asDate }
    func `as`<T: DateConvertible>(_ type: T.Type, using formatter: DateFormatter) -> Date? { self.asDate(using: formatter) }
}


extension ISO8601DateFormatter: DateFormatter {
}

extension Foundation.DateFormatter: DateFormatter {
    
}
