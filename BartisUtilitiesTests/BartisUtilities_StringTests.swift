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
        let trailingLenght = "...".count

        //When
        let truncatedString = aVeryLongString.trunc(length: expectedLenght)

        //Then
        XCTAssertTrue(truncatedString == expectedString, "Expected the strings to be identical")
        XCTAssertTrue(truncatedString.count == expectedLenght + trailingLenght, "Expected the lenght to be identical")
    }

    func test_String_truncateToLenght_noTrailingString_lenghtLongerThanString() {
        //Given
        let expectedLenght = aVeryLongString.count + 1

        //When
        let truncatedString = aVeryLongString.trunc(length: expectedLenght)

        //Then
        XCTAssertTrue(truncatedString != expectedString, "Expected the strings to be different")
        XCTAssertTrue(truncatedString.count == aVeryLongString.count, "Expected the lenght to be identical")
    }

    func test_String_truncateToLenght_noTrailingString_lenghtEqualToString() {
        //Given
        let expectedLenght = aVeryLongString.count

        //When
        let truncatedString = aVeryLongString.trunc(length: expectedLenght)

        //Then
        XCTAssertTrue(truncatedString != expectedString, "Expected the strings to be different")
        XCTAssertTrue(truncatedString.count == aVeryLongString.count, "Expected the lenght to be identical")
    }

//    func test_String_truncateToLenght_noTrailingString_lenghtShorterThenString() {
//        //Given
//        let expectedLenght = aVeryLongString.count + 1
//
//        //When
//        let truncatedString = aVeryLongString.trunc(length: expectedLenght)
//
//        //Then
//        XCTAssertTrue(truncatedString != expectedString, "Expected the strings to be different")
//        XCTAssertTrue(truncatedString.count == aVeryLongString.count, "Expected the lenght to be identical")
//    }

    func test_String_truncateToLenght_givenTrailingString() {
        //Given
        let aVeryLongString = "This is a very long string"
        let expectedString = "This is a very l///"
        let trailingLenght = "...".count

        //When
        let truncatedString = aVeryLongString.trunc(length: expectedLenght, trailing: "///")

        //Then
        XCTAssertTrue(truncatedString == expectedString, "Expected the strings to be identical")
        XCTAssertTrue(truncatedString.count == expectedLenght + trailingLenght, "Expected the lenght to be identical")
    }

    func test_String_CharaterAtIndex() {
        //Given
        let expectedCharacter: Character = "s"
        let indexOfChar = 3

        //When
        let outputCharacter: Character = aVeryLongString[indexOfChar]

        //Then
        XCTAssertTrue(outputCharacter == expectedCharacter, "Expected the character at index \(indexOfChar) to be \(expectedCharacter)")
    }

    func test_String_StringAtIndex() {
        //Given
        let expectedCharacter = "s"
        let indexOfChar = 3

        //When
        let outputCharacter: String = aVeryLongString[indexOfChar]

        //Then
        XCTAssertTrue(outputCharacter == expectedCharacter, "Expected the character at index \(indexOfChar) to be \(expectedCharacter)")
    }

    func test_String_urlFromString_success() {
        //Given
        let urlString = "www.url.test"
        let expectedURL = URL(string: urlString)

        //When & Then
        XCTAssertEqual(expectedURL, urlString.url(), "Expected the URLs to be identical")
    }

    func test_String_urlFromString_failed() {
        //Given
        let urlString = "☭"

        //When & Then
        let expectedURL = urlString.url()
        XCTAssertTrue(expectedURL.absoluteString.isEmpty, "Expected the URL to be empty")
    }
    
    func test_String_stringCGSize_validString() {
        //Given
        let testString = "test string"
        
        //When & Then
        XCTAssertTrue(testString.cgSize().width > 0, "Expected the width to be greater than 0")
        XCTAssertTrue(testString.cgSize().height > 0, "Expected the height to be greater than 0")
    }
    
    func test_String_stringCGSize_emptyString() {
        //Given
        let testString = ""
        
        //When & Then
        XCTAssertEqual(testString.cgSize().width, 0, "Expected the width to be 0")
        XCTAssertTrue(testString.cgSize().height > 0, "Expected the height to be greater than 0")
    }
    
    func test_String_stringCGSize_nilString() {
        //Given
        let testString: String? = nil
        
        //When & Then
        XCTAssertNil(testString?.cgSize(), "Expected the size to be nil")
    }
    
    func test_String_stringCGSize_validString_customFont() {
        //Given
        let testString = "test string"
        
        //When & Then
        XCTAssertTrue(testString.cgSize(UIFont(name: "Arial", size: 16)!).width > 0, "Expected the width to be greater than 0")
        XCTAssertTrue(testString.cgSize(UIFont(name: "Arial", size: 16)!).height > 0, "Expected the height to be greater than 0")
    }
}
