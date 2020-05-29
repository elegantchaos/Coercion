// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import Coercion

final class DictionaryCoercionTests: XCTestCase {
    let example: [String:Any] = [
        "string": "123",
        "int": 123,
        "double": 123.456,
        "bool": true
    ]

    func testString() {
        XCTAssertEqual(example[stringWithKey: "string"], "123")
        XCTAssertEqual(example[stringWithKey: "int"], "123")
        XCTAssertEqual(example[stringWithKey: "double"], "123.456")
        XCTAssertEqual(example[stringWithKey: "bool"], "true")
        XCTAssertNil(example[stringWithKey: "missing"])
    }
    
    func testInt() {
        XCTAssertEqual(example[intWithKey: "string"], 123)
        XCTAssertEqual(example[intWithKey: "int"], 123)
        XCTAssertEqual(example[intWithKey: "double"], 123)
        XCTAssertEqual(example[intWithKey: "bool"], 1)
        XCTAssertNil(example[intWithKey: "missing"])
    }

    func testDouble() {
        XCTAssertEqual(example[doubleWithKey: "string"], 123)
        XCTAssertEqual(example[doubleWithKey: "int"], 123)
        XCTAssertEqual(example[doubleWithKey: "double"], 123.456)
        XCTAssertEqual(example[doubleWithKey: "bool"], 1)
        XCTAssertNil(example[doubleWithKey: "missing"])
    }

}
