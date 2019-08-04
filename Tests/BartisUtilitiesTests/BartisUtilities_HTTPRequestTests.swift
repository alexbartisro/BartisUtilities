//
//  BartisUtilities_HTTPRequestTests.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 07/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import XCTest
@testable import BartisUtilities

class BartisUtilities_HTTPRequestTests: XCTestCase {
    let expectedUsername = "usern4me"
    let expectedPassword = "passw0rd"
    let expectedUrl = "www.url.test"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_HTTPRequest_WithURL() {
        //Given
        let queryParams: [String : AnyHashable] = ["Param1": "Value1", "Param2": 2, "Param3": true]
        let expectedUrlWithParams = expectedUrl + queryParams.queryString!

        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: expectedUrl,
                                              queryParams: queryParams)

            //Then
            XCTAssertTrue(httpRequest.urlString == expectedUrlWithParams, "Expected URL to be identical")
            XCTAssertTrue(httpRequest.loginString.isEmpty, "Expected the login string to be empty")
            XCTAssertTrue(httpRequest.method == .Get, "Expected the same method")
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }
    }

    func test_HTTPRequest_WithURL_Username_Password() {
        //Given
        let expectedLoginString = createLoginStringFrom(username: expectedUsername, password: expectedPassword)

        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: expectedUrl,
                                              username: expectedUsername,
                                              password: expectedPassword)

            //Then
            XCTAssertTrue(httpRequest.urlString == expectedUrl, "Expected URL to be identical")
            XCTAssertTrue(httpRequest.loginString == expectedLoginString, "Expected the correct login string")
            XCTAssertTrue(httpRequest.method == .Get, "Expected the same method")
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }
    }


    func test_HTTPRequest_WithURL_InvalidUsername_InvalidPassword() {
        //Given

        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: expectedUrl,
                                              username: "ă",
                                              password: "ï")

            //Then
            XCTAssertTrue(httpRequest.urlString == expectedUrl, "Expected URL to be identical")
            XCTAssertTrue(httpRequest.loginString.isEmpty, "Expected the correct login string")
            XCTAssertTrue(httpRequest.method == .Get, "Expected the same method")
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }
    }

    func test_HTTPRequest_WithURL_Username_Password_QueryParams() {
        //Given
        let expectedLoginString = createLoginStringFrom(username: expectedUsername, password: expectedPassword)
        let queryParams: [String : AnyHashable] = ["Param1": "Value1", "Param2": 2, "Param3": true]
        let expectedUrlWithParams = expectedUrl + queryParams.queryString!

        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: expectedUrl,
                                              username: expectedUsername,
                                              password: expectedPassword,
                                              queryParams: queryParams)

            //Then
            XCTAssertTrue(httpRequest.urlString == expectedUrlWithParams, "Expected URL to be identical")
            XCTAssertTrue(httpRequest.loginString == expectedLoginString, "Expected the correct login string")
            XCTAssertTrue(httpRequest.method == .Get, "Expected the same method")
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }
    }

    func test_HTTPRequest_WithInvalidURL() {
        //Given
        let expectedError = HTTPRequestError.URLInvalidError.localizedDescription
        let invalidUrl = ""

        //When
        do {
            _ = try HTTPRequest(method: .Get, url: invalidUrl)
        } catch {
            XCTAssertTrue(error.localizedDescription == expectedError, "Expected to fail with \(expectedError)")
        }
    }
}

private func createLoginStringFrom(username: String, password: String) -> String {
    let loginString = NSString(format: "%@:%@", username, password)
    return loginString.data(using: String.Encoding.utf8.rawValue)!.base64EncodedString()
}
