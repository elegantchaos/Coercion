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
        XCTAssertEqual(123.456.asDouble, 123.456)

        XCTAssertNil("not a number".asDouble)
        XCTAssertNil(" 123 ".asDouble)
        XCTAssertNil("(123) ".asDouble)
    }

}
