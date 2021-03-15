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
        XCTAssertEqual(NSNumber(123).asInt, 123)
        XCTAssertEqual(NSNumber(123.456).asInt, 123)
        XCTAssertEqual(kCFBooleanTrue!.asInt, 1)
        XCTAssertEqual(kCFBooleanFalse!.asInt, 0)
        XCTAssertEqual(NSNumber(true).asInt, 1)
        XCTAssertEqual(NSNumber(false).asInt, 0)

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
        XCTAssertEqual(NSNumber(123).asUInt, 123)
        XCTAssertEqual(NSNumber(123.456).asUInt, 123)
        XCTAssertEqual(kCFBooleanTrue!.asUInt, 1)
        XCTAssertEqual(kCFBooleanFalse!.asUInt, 0)
        XCTAssertEqual(NSNumber(true).asUInt, 1)
        XCTAssertEqual(NSNumber(false).asUInt, 0)

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
        XCTAssertEqual(NSNumber(123).asDouble, 123.0)
        XCTAssertEqual(NSNumber(123.456).asDouble, 123.456)
        XCTAssertEqual(kCFBooleanTrue!.asDouble, 1.0)
        XCTAssertEqual(kCFBooleanFalse!.asDouble, 0.0)
        XCTAssertEqual(NSNumber(true).asDouble, 1.0)
        XCTAssertEqual(NSNumber(false).asDouble, 0.0)

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
        XCTAssertEqual(NSNumber(123).asBool, true)
        XCTAssertEqual(NSNumber(123.456).asBool, true)
        XCTAssertEqual(kCFBooleanTrue!.asBool, true)
        XCTAssertEqual(kCFBooleanFalse!.asBool, false)
        XCTAssertEqual(NSNumber(true).asBool, true)
        XCTAssertEqual(NSNumber(false).asBool, false)
    }

    func testStringCoercion() {
        XCTAssertEqual("test".asString, "test")
        XCTAssertEqual(123.asString, "123")
        XCTAssertEqual(123.456.asString, "123.456")
        XCTAssertEqual(true.asString, "true")
        XCTAssertEqual(false.asString, "false")
        XCTAssertEqual(NSNumber(123).asString, "123")
        XCTAssertEqual(NSNumber(123.456).asString, "123.456")
        XCTAssertEqual(kCFBooleanTrue!.asString, "true")
        XCTAssertEqual(kCFBooleanFalse!.asString, "false")
        XCTAssertEqual(NSNumber(true).asString, "true")
        XCTAssertEqual(NSNumber(false).asString, "false")
    }
    
    func testDateCoercion() {
        let standardFormatter = StandardConverter.shared.dateFormatter
        let longFormatter = DateFormatter()
        longFormatter.dateStyle = .full
        longFormatter.timeStyle = .full
        longFormatter.locale = Locale(identifier: "en_US")
        let date = standardFormatter.date(from: "1969-11-12T17:55:25Z")
        XCTAssertEqual(date.asDate, date)
        XCTAssertEqual(Double(-982562675).asDate, date)
        XCTAssertEqual(Int(-982562675).asDate, date)
        XCTAssertEqual("1969-11-12T17:55:25Z".asDate, date)
        XCTAssertEqual("Wednesday, November 12, 1969 at 6:55:25 PM GMT+01:00".asDate(using: longFormatter), date)
    }
}
