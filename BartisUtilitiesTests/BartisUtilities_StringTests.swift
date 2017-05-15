//
//  BartisUtilities_StringTests.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 06/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import XCTest
@testable import BartisUtilities

class BartisUtilities_StringTests: XCTestCase {
    let aVeryLongString = "This is a very long string"
    let expectedString = "This is a very l..."
    let expectedLenght = 16

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        self.continueAfterFailure = true
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_String_truncateToLenght_noTrailingString() {
        //Given
        let trailingLenght = "...".characters.count

        //When
        let truncatedString = aVeryLongString.trunc(length: expectedLenght)

        //Then
        XCTAssertTrue(truncatedString == expectedString, "Expected the strings to be identical")
        XCTAssertTrue(truncatedString.characters.count == expectedLenght + trailingLenght, "Expected the lenght to be identical")
    }

    func test_String_truncateToLenght_noTrailingString_lenghtLongerThanString() {
        //Given
        let expectedLenght = aVeryLongString.characters.count + 1

        //When
        let truncatedString = aVeryLongString.trunc(length: expectedLenght)

        //Then
        XCTAssertTrue(truncatedString != expectedString, "Expected the strings to be different")
        XCTAssertTrue(truncatedString.characters.count == aVeryLongString.characters.count, "Expected the lenght to be identical")
    }

    func test_String_truncateToLenght_noTrailingString_lenghtEqualToString() {
        //Given
        let expectedLenght = aVeryLongString.characters.count

        //When
        let truncatedString = aVeryLongString.trunc(length: expectedLenght)

        //Then
        XCTAssertTrue(truncatedString != expectedString, "Expected the strings to be different")
        XCTAssertTrue(truncatedString.characters.count == aVeryLongString.characters.count, "Expected the lenght to be identical")
    }

//    func test_String_truncateToLenght_noTrailingString_lenghtShorterThenString() {
//        //Given
//        let expectedLenght = aVeryLongString.characters.count + 1
//
//        //When
//        let truncatedString = aVeryLongString.trunc(length: expectedLenght)
//
//        //Then
//        XCTAssertTrue(truncatedString != expectedString, "Expected the strings to be different")
//        XCTAssertTrue(truncatedString.characters.count == aVeryLongString.characters.count, "Expected the lenght to be identical")
//    }

    func test_String_truncateToLenght_givenTrailingString() {
        //Given
        let aVeryLongString = "This is a very long string"
        let expectedString = "This is a very l///"
        let trailingLenght = "...".characters.count

        //When
        let truncatedString = aVeryLongString.trunc(length: expectedLenght, trailing: "///")

        //Then
        XCTAssertTrue(truncatedString == expectedString, "Expected the strings to be identical")
        XCTAssertTrue(truncatedString.characters.count == expectedLenght + trailingLenght, "Expected the lenght to be identical")
    }

    func test_String_CharaterAtIndex() {
        //Given
        let expectedCharacter: Character = "s"
        let indexOfChar = 3

        //When
        let outputCharacter: Character = aVeryLongString[indexOfChar]

        XCTAssertTrue(outputCharacter == expectedCharacter, "Expected the character at index \(indexOfChar) to be \(expectedCharacter)")
    }

    func test_String_StringAtIndex() {
        //Given
        let expectedCharacter = "s"
        let indexOfChar = 3

        //When
        let outputCharacter: String = aVeryLongString[indexOfChar]

        XCTAssertTrue(outputCharacter == expectedCharacter, "Expected the character at index \(indexOfChar) to be \(expectedCharacter)")
    }
}
