// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public extension Dictionary {
    subscript(asString key: Key, converter: Converter = StandardConverter.shared) -> String? {
        return converter.asString(self[key])
    }

    subscript(asInt key: Key, converter: Converter = StandardConverter.shared) -> Int? {
        return converter.asInt(self[key])
    }

    subscript(asDouble key: Key, converter: Converter = StandardConverter.shared) -> Double? {
        return converter.asDouble(self[key])
    }
    
    subscript(asDate key: Key, converter: Converter = StandardConverter.shared) -> Date? {
        return converter.asDate(self[key])
    }

}
