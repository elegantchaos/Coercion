
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import Coercion

final class ConverterTests: XCTestCase {
    let converter = StandardConverter.shared
    
    let example: [String:Any] = [
        "string": "123",
        "int": 123,
        "double": 123.456,
        "bool": true
    ]

    func testString() {
        XCTAssertEqual(converter.asString("123"), "123")
        XCTAssertEqual(converter.asString(123), "123")
        XCTAssertEqual(converter.asString(123.456), "123.456")
        XCTAssertEqual(converter.asString(true), "true")
        XCTAssertNil(converter.asString(nil))
    }
    
    func testInt() {
        XCTAssertEqual(converter.asInt("123"), 123)
        XCTAssertEqual(converter.asInt(123), 123)
        XCTAssertEqual(converter.asInt(123.456), 123)
        XCTAssertEqual(converter.asInt(true), 1)
        XCTAssertNil(converter.asInt(nil))
    }

    func testDouble() {
        XCTAssertEqual(converter.asDouble("123"), 123)
        XCTAssertEqual(converter.asDouble(123), 123)
        XCTAssertEqual(converter.asDouble(123.456), 123.456)
        XCTAssertEqual(converter.asDouble(true), 1)
        XCTAssertNil(converter.asDouble(nil))
    }

}
