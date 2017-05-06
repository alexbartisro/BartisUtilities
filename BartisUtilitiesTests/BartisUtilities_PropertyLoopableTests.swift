//
//  BartisUtilities_PropertyLoopableTests.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 06/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation
import XCTest
@testable import BartisUtilities

class BartisUtilities_PropertyLoopableTests: XCTestCase {
    fileprivate var person = Person.sharedInstance

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        self.continueAfterFailure = true
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_PropertyLoopable_AllProperties() {
        //Given
        let expectedPropertyCount = 2
        let expectedFirstPropertyName = "name"
        let expectedSecondPropertyName = "age"

        //When
        let properties = person.allProperties()

        //Then
        XCTAssertTrue(properties.count == expectedPropertyCount, "Expected the property count to be \(expectedPropertyCount)")
        XCTAssertTrue(properties[0] == expectedFirstPropertyName, "Expected the property to be \(expectedFirstPropertyName)")
        XCTAssertTrue(properties[1] == expectedSecondPropertyName, "Expected the property to be \(expectedSecondPropertyName)")
    }

    func test_PropertyLoopable_AllValues() {
        //Given
        let expectedValueCount = 2
        let personName = "Mike"
        let personAge = "28"

        //When
        let properties = person.allValues()

        //Then
        XCTAssertTrue(properties.count == expectedValueCount, "Expected the property count to be \(expectedValueCount)")
        XCTAssertTrue(properties[0] == personName, "Expected the property to be \(personName)")
        XCTAssertTrue(properties[1] == personAge, "Expected the property to be \(personAge)")
    }
}

private struct Person: PropertyLoopable {
    static let sharedInstance = Person()

    var name = "Mike"
    var age = "28"
}
