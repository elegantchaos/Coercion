// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 29/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public protocol DateConvertible {
    var asDate: Date? { get }
}

public protocol DateStringConvertible: DateConvertible {
    func asDate(using: DateFormatter) -> Date?
}

extension DateStringConvertible {
    public var asDate: Date? { asDate(using: StandardConverter.shared.dateFormatter) }
}

extension Optional where Wrapped: DateConvertible {
    var asDate: Date? {
        return self?.asDate
    }
}

extension ISO8601DateFormatter: DateFormatter {
}

extension Foundation.DateFormatter: DateFormatter {
    
}
