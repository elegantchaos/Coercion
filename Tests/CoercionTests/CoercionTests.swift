import XCTest
@testable import Coercion

final class CoercionTests: XCTestCase {
    func testIntCoercion() {
        XCTAssertEqual("123".asInt, 123)
        XCTAssertEqual("-456".asInt, -456)
        XCTAssertNil("not a number".asInt)
        XCTAssertNil(" 123 ".asInt)
        XCTAssertNil("(123) ".asInt)
    }
}
