// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
@testable import Coercion

typealias CustomDict = Dictionary<String, Int>


func subscriptConverter<CustomDict>(for type: CustomDict) -> Converter {
    return FakeConverter()
}


final class DictionaryCoercionTests: XCTestCase {
    let example: [String:Any] = [
        "string": "123",
        "nsstring": "123" as NSString,
        "int": 123,
        "double": 123.456,
        "bool": true,
        "nsint": NSNumber(123),
        "nsdouble": NSNumber(123.456),
        "nsbool": kCFBooleanTrue!
    ]

    func testString() {
        XCTAssertEqual(example[asString: "string"], "123")
        XCTAssertEqual(example[asString: "nsstring"], "123")
        XCTAssertEqual(example[asString: "int"], "123")
        XCTAssertEqual(example[asString: "nsint"], "123")
        XCTAssertEqual(example[asString: "double"], "123.456")
        XCTAssertEqual(example[asString: "nsdouble"], "123.456")
        XCTAssertEqual(example[asString: "bool"], "true")
        XCTAssertEqual(example[asString: "nsbool"], "true")
        XCTAssertNil(example[asString: "missing"])
    }
    
    func testInt() {
        XCTAssertEqual(example[asInt: "string"], 123)
        XCTAssertEqual(example[asInt: "nsstring"], 123)
        XCTAssertEqual(example[asInt: "int"], 123)
        XCTAssertEqual(example[asInt: "double"], 123)
        XCTAssertEqual(example[asInt: "bool"], 1)
        XCTAssertNil(example[asInt: "missing"])
    }

    func testDouble() {
        XCTAssertEqual(example[asDouble: "string"], 123)
        XCTAssertEqual(example[asDouble: "nsstring"], 123)
        XCTAssertEqual(example[asDouble: "int"], 123)
        XCTAssertEqual(example[asDouble: "double"], 123.456)
        XCTAssertEqual(example[asDouble: "bool"], 1)
        XCTAssertNil(example[asDouble: "missing"])
    }

    func testOverridingConverter() {
        let converter = FakeConverter()
        let example: CustomDict = [ "foo": 1, "bar": 2]
        XCTAssertEqual(example[asInt: "foo", converter], 999)
        XCTAssertEqual(example[asInt: "bar", converter], 999)
    }
    
}
