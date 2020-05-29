// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public extension Dictionary {
    subscript(stringWithKey key: Key) -> String? {
        return Converter.shared.asString(self[key])
    }

    subscript(intWithKey key: Key) -> Int? {
        return Converter.shared.asInt(self[key])
    }

    subscript(doubleWithKey key: Key) -> Double? {
        return Converter.shared.asDouble(self[key])
    }
    
    subscript(dateWithKey key: Key) -> Date? {
        return Converter.shared.asDate(self[key])
    }

}
