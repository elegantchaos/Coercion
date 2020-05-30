// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 30/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public protocol DataConvertible {
    var asData: Data? { get }
}

extension DataConvertible where Self: Encodable {
    public var asData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}

extension Data: DataConvertible {
    public var asData: Data? { self }
}
