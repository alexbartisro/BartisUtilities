//
//  BartisUtilities_DictionaryTests.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 07/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import XCTest
@testable import BartisUtilities

class BartisUtilities_DictionaryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Dictionary_QueryParams() {
        //Given
        let queryParams = testDictionary.queryString
        let expectedParams = "?Param2=Value2&Param1=Value1"

        //Then
        XCTAssertTrue(queryParams == expectedParams, "Expected the query params to be identical")
    }
}

let expectedParam1 = "Param1"
let expectedValue1 = "Value1"
let expectedParam2 = "Param2"
let expectedValue2 = "Value2"
var testDictionary = [expectedParam1: expectedValue1,
                      expectedParam2: expectedValue2]
