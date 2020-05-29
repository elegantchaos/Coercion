import XCTest
@testable import Coercion

final class CoercionTests: XCTestCase {
    func testIntCoercion() {
        XCTAssertEqual("123".asInt, 123)
        XCTAssertEqual("-456".asInt, -456)
        XCTAssertEqual(true.asInt, 1)
        XCTAssertEqual(false.asInt, 0)
        XCTAssertEqual(123.456.asInt, 123)

        XCTAssertNil("not a number".asInt)
        XCTAssertNil(" 123 ".asInt)
        XCTAssertNil("(123) ".asInt)
    }
    
    func testDoubleCoercion() {
        XCTAssertEqual("123.456".asDouble, 123.456)
        XCTAssertEqual("-456.123".asDouble, -456.123)
        XCTAssertEqual(true.asDouble, 1.0)
        XCTAssertEqual(false.asDouble, 0.0)
        XCTAssertEqual(123.asDouble, 123.0)
        XCTAssertEqual(123.456.asDouble, 123.456)

        XCTAssertNil("not a number".asDouble)
        XCTAssertNil(" 123 ".asDouble)
        XCTAssertNil("(123) ".asDouble)
    }

    func testBoolCoercion() {
        XCTAssertEqual("123.456".asBool, true)
        XCTAssertEqual("0".asBool, false)
        XCTAssertEqual("tRue".asBool, true)
        XCTAssertEqual("falSe".asBool, false)
        XCTAssertEqual("YeS".asBool, true)
        XCTAssertEqual("nO".asBool, false)
        XCTAssertEqual("".asBool, false)
        XCTAssertEqual("nil".asBool, false)
        XCTAssertEqual(true.asBool, true)
        XCTAssertEqual(false.asBool, false)
        XCTAssertEqual(0.0.asBool, false)
        XCTAssertEqual(123.456.asBool, true)
        XCTAssertEqual(123.asBool, true)
        XCTAssertEqual(0.asBool, false)
    }

    func testStringCoercion() {
        XCTAssertEqual("test".asString, "test")
        XCTAssertEqual(123.asString, "123")
    }
}
