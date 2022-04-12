import XCTest
@testable import Coercion

final class GenericCoercionTests: XCTestCase {
    func testIntCoercion() {
        XCTAssertEqual(123.as(Int.self), 123)
        XCTAssertEqual("-456".as(Int.self), -456)
        XCTAssertEqual(true.as(Int.self), 1)
        XCTAssertEqual(false.as(Int.self), 0)
        XCTAssertEqual(123.as(Int.self), 123)
        XCTAssertEqual((-123).as(Int.self), -123)
        XCTAssertEqual(123.456.as(Int.self), 123)
        XCTAssertEqual(NSNumber(123).as(Int.self), 123)
        XCTAssertEqual(NSNumber(123.456).as(Int.self), 123)
        XCTAssertEqual(NSNumber(true).as(Int.self), 1)
        XCTAssertEqual(NSNumber(false).as(Int.self), 0)

#if !os(Linux)
        XCTAssertEqual(kCFBooleanTrue!.as(Int.self), 1)
        XCTAssertEqual(kCFBooleanFalse!.as(Int.self), 0)
#endif

    }

    func testUIntCoercion() {
        XCTAssertEqual("123".as(UInt.self), 123)
        XCTAssertEqual(true.as(UInt.self), 1)
        XCTAssertEqual(false.as(UInt.self), 0)
        XCTAssertEqual(123.as(UInt.self), 123)
        XCTAssertEqual(123.456.as(UInt.self), 123)
        XCTAssertEqual(NSNumber(123).as(UInt.self), 123)
        XCTAssertEqual(NSNumber(123.456).as(UInt.self), 123)
        XCTAssertEqual(NSNumber(true).as(UInt.self), 1)
        XCTAssertEqual(NSNumber(false).as(UInt.self), 0)
        
        let u1: UInt? = "not a number".as(UInt.self)
        XCTAssertNil(u1)
        let u2: UInt? = " 123 ".as(UInt.self)
        XCTAssertNil(u2)
        let u3: UInt? = "(123) ".as(UInt.self)
        XCTAssertNil(u3)
        let u4: UInt? = "-456".as(UInt.self)
        XCTAssertNil(u4)
        
#if !os(Linux)
        XCTAssertEqual(kCFBooleanTrue!.as(UInt.self), 1)
        XCTAssertEqual(kCFBooleanFalse!.as(UInt.self), 0)
#endif
    }


    func testDoubleCoercion() {
        XCTAssertEqual("123.456".as(Double.self), 123.456)
        XCTAssertEqual("-456.123".as(Double.self), -456.123)
        XCTAssertEqual(true.as(Double.self), 1.0)
        XCTAssertEqual(false.as(Double.self), 0.0)
        XCTAssertEqual(123.as(Double.self), 123.0)
        XCTAssertEqual(123.456.as(Double.self), 123.456)
        XCTAssertEqual(NSNumber(123).as(Double.self), 123.0)
        XCTAssertEqual(NSNumber(123.456).as(Double.self), 123.456)
        XCTAssertEqual(NSNumber(true).as(Double.self), 1.0)
        XCTAssertEqual(NSNumber(false).as(Double.self), 0.0)
        
        XCTAssertNil("not a number".as(Double.self) as Optional<Double>)
        XCTAssertNil(" 123 ".as(Double.self) as Optional<Double>)
        XCTAssertNil("(123) ".as(Double.self) as Optional<Double>)
        
#if !os(Linux)
        XCTAssertEqual(kCFBooleanTrue!.as(Double.self), 1.0)
        XCTAssertEqual(kCFBooleanFalse!.as(Double.self), 0.0)
#endif
    }
    
    func testBoolCoercion() {
        XCTAssertEqual("123.456".as(Bool.self), true)
        XCTAssertEqual("0".as(Bool.self), false)
        XCTAssertEqual("tRue".as(Bool.self), true)
        XCTAssertEqual("falSe".as(Bool.self), false)
        XCTAssertEqual("YeS".as(Bool.self), true)
        XCTAssertEqual("nO".as(Bool.self), false)
        XCTAssertEqual("".as(Bool.self), false)
        XCTAssertEqual("nil".as(Bool.self), false)
        XCTAssertEqual(true.as(Bool.self), true)
        XCTAssertEqual(false.as(Bool.self), false)
        XCTAssertEqual(0.0.as(Bool.self), false)
        XCTAssertEqual(123.456.as(Bool.self), true)
        XCTAssertEqual(123.as(Bool.self), true)
        XCTAssertEqual(0.as(Bool.self), false)
        XCTAssertEqual(NSNumber(123).as(Bool.self), true)
        XCTAssertEqual(NSNumber(123.456).as(Bool.self), true)
        XCTAssertEqual(NSNumber(true).as(Bool.self), true)
        XCTAssertEqual(NSNumber(false).as(Bool.self), false)
        
#if !os(Linux)
        XCTAssertEqual(kCFBooleanTrue!.as(Bool.self), true)
        XCTAssertEqual(kCFBooleanFalse!.as(Bool.self), false)
#endif
    }

    func testStringCoercion() {
        XCTAssertEqual("test".as(String.self), "test")
        XCTAssertEqual(123.as(String.self), "123")
        XCTAssertEqual(123.456.as(String.self), "123.456")
        XCTAssertEqual(true.as(String.self), "true")
        XCTAssertEqual(false.as(String.self), "false")
        XCTAssertEqual(NSNumber(123).as(String.self), "123")
        XCTAssertEqual(NSNumber(123.456).as(String.self), "123.456")
        XCTAssertEqual(NSNumber(true).as(String.self), "true")
        XCTAssertEqual(NSNumber(false).as(String.self), "false")
        
#if !os(Linux)
        XCTAssertEqual(kCFBooleanTrue!.as(String.self), "true")
        XCTAssertEqual(kCFBooleanFalse!.as(String.self), "false")
#endif
    }

    func testDateCoercion() {
        let standardFormatter = StandardConverter.shared.dateFormatter
        let longFormatter = DateFormatter()
        longFormatter.dateStyle = .full
        longFormatter.timeStyle = .full
        longFormatter.locale = Locale(identifier: "en_US")
        let date = standardFormatter.date(from: "1969-11-12T17:55:25Z")!
        XCTAssertEqual(date.as(Date.self), date)
        XCTAssertEqual(Double(-982562675).as(Date.self), date)
        XCTAssertEqual(Int(-982562675).as(Date.self), date)
        XCTAssertEqual("1969-11-12T17:55:25Z".as(Date.self), date)
        XCTAssertEqual("Wednesday, November 12, 1969 at 6:55:25 PM GMT+01:00".as(Date.self, using: longFormatter), date)
    }

}
