
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import Coercion

struct FakeConverter: Converter {
    func asString<T>(_ value: T?) -> String? where T : StringConvertible {
        return value == nil ? nil : "fake"
    }
    
    func asString(_ value: Any?) -> String? {
        return value == nil ? nil : "fake"
    }
    
    func asBool(_ value: Any?) -> Bool {
        return value == nil ? false : true
    }
    
    func asInt<T>(_ value: T?) -> Int? where T : IntConvertible {
        return value == nil ? nil : 999
    }
    
    func asInt(_ value: Any?) -> Int? {
        return value == nil ? nil : 999
    }
    
    func asUInt<T>(_ value: T?) -> UInt? where T : UIntConvertible {
        return value == nil ? nil : 999
    }
    
    func asUInt(_ value: Any?) -> UInt? {
        return value == nil ? nil : 999
    }
    
    func asDouble<T>(_ value: T?) -> Double? where T : DoubleConvertible {
        return value == nil ? nil : 999.999
    }
    
    func asDouble(_ value: Any?) -> Double? {
        return value == nil ? nil : 999.999
    }
    
    func asDate(_ value: Any?) -> Date? {
        return Date(timeIntervalSinceReferenceDate: 0)
    }
}

final class ConverterProtocolTests: XCTestCase {
    let converter = FakeConverter()
    
    let example: [String:Any] = [
        "string": "123",
        "int": 123,
        "double": 123.456,
        "bool": true
    ]

    func testString() {
        XCTAssertEqual(converter.asString("123"), "fake")
        XCTAssertEqual(converter.asString(123), "fake")
        XCTAssertEqual(converter.asString(123.456), "fake")
        XCTAssertEqual(converter.asString(true), "fake")
        XCTAssertNil(converter.asString(nil))
    }
    
    func testInt() {
        XCTAssertEqual(converter.asInt("123"), 999)
        XCTAssertEqual(converter.asInt(123), 999)
        XCTAssertEqual(converter.asInt(123.456), 999)
        XCTAssertEqual(converter.asInt(true), 999)
        XCTAssertNil(converter.asInt(nil))
    }

    func testDouble() {
        XCTAssertEqual(converter.asDouble("123"), 999.999)
        XCTAssertEqual(converter.asDouble(123), 999.999)
        XCTAssertEqual(converter.asDouble(123.456), 999.999)
        XCTAssertEqual(converter.asDouble(true), 999.999)
        XCTAssertNil(converter.asDouble(nil))
    }

    func testBool() {
        XCTAssertTrue(converter.asBool("123"))
        XCTAssertTrue(converter.asBool(123))
        XCTAssertTrue(converter.asBool(123.456))
        XCTAssertTrue(converter.asBool(true))
        XCTAssertFalse(converter.asBool(nil))
    }
}
