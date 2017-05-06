//
//  BartisUtilities_UIColorTests.swift
//  BartisUtilities_UIColorTests
//
//  Created by Alex Bartis on 05/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import XCTest
@testable import BartisUtilities

class BartisUtilities_UIColorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        self.continueAfterFailure = true
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_UIColor_from12BitHex() {
        //Given
        let whiteColor = UIColor(hexString: "#fff").toHexString()

        //Then
        XCTAssertTrue(whiteColor == UIColor.white.toHexString(), "Expected to be the same color")
    }
    
    func test_UIColor_from24BitHex() {
        //Given
        let whiteColor = UIColor(hexString: "#ffffff").toHexString()

        //Then
        XCTAssertTrue(whiteColor == UIColor.white.toHexString(), "Expected to be the same color")
    }

    func test_UIColor_from32BitHex() {
        //Given
        let whiteColor = UIColor(hexString: "#ffffffff").toHexString()

        //Then
        XCTAssertTrue(whiteColor == UIColor.white.toHexString(), "Expected to be the same color")
    }

    func test_UIColor_fromUnknownBitHex() {
        //Given
        let whiteColor = UIColor(hexString: "#fffffff").toHexString()

        //Then
        XCTAssertFalse(whiteColor == UIColor.white.toHexString(), "Expected the hex values to be different")
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
