import XCTest
@testable import Coercion

final class CoercionTests: XCTestCase {
    func testIntCoercion() {
        XCTAssertEqual("123".asInt, 123)
        XCTAssertEqual("-456".asInt, -456)
        XCTAssertEqual(true.asInt, 1)
        XCTAssertEqual(false.asInt, 0)
        XCTAssertEqual(123.asInt, 123)
        XCTAssertEqual((-123).asInt, -123)
        XCTAssertEqual(123.456.asInt, 123)

        XCTAssertNil("not a number".asInt)
        XCTAssertNil(" 123 ".asInt)
        XCTAssertNil("(123) ".asInt)
    }

    func testUIntCoercion() {
        XCTAssertEqual("123".asUInt, 123)
        XCTAssertEqual(true.asUInt, 1)
        XCTAssertEqual(false.asUInt, 0)
        XCTAssertEqual(123.asUInt, 123)
        XCTAssertEqual(123.456.asUInt, 123)

        XCTAssertNil("not a number".asUInt)
        XCTAssertNil(" 123 ".asUInt)
        XCTAssertNil("(123) ".asUInt)
        XCTAssertNil("-456".asUInt)
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
        XCTAssertEqual(123.456.asString, "123.456")
        XCTAssertEqual(true.asString, "true")
        XCTAssertEqual(false.asString, "false")
    }
}
