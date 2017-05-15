//
//  BartisUtilities_HTTPRequesterTests.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 08/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import XCTest
@testable import BartisUtilities

class BartisUtilities_HTTPRequesterTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_HTTPRequester_Get_WithQueryParams() {
        //Given
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        let queryParams = ["userId": 1]
        let expectedStatusCode = 200
        let requestExpectation = expectation(description: "Run HTTP Request")

        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                               url: url,
                                               queryParams: queryParams)

            HTTPRequester.execute(httpRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                //Then
                if let _ = error {
                    XCTFail("Expected the request not to fail")
                } else {
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    let code = (response as! HTTPURLResponse).statusCode

                    XCTAssertTrue(responseString != nil, "Expected the response string not to be empty")
                    XCTAssertTrue(code == expectedStatusCode, "Expected status code to be \(expectedStatusCode)")
                }

                requestExpectation.fulfill()
            }
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }

        waitForExpectations(timeout: 30, handler: nil)
    }

    func test_HTTPRequester_Get_WithQueryParams_And_Credentials() {
        //Given
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        let queryParams = ["userId": 1]
        let expectedStatusCode = 200
        let requestExpectation = expectation(description: "Run HTTP Request")

        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: url,
                                              username: "test",
                                              password: "test",
                                              queryParams: queryParams)

            HTTPRequester.execute(httpRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                //Then
                if let _ = error {
                    XCTFail("Expected the request not to fail")
                } else {
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    let code = (response as! HTTPURLResponse).statusCode

                    XCTAssertTrue(responseString != nil, "Expected the response string not to be empty")
                    XCTAssertTrue(code == expectedStatusCode, "Expected status code to be \(expectedStatusCode)")
                }

                requestExpectation.fulfill()
            }
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }

        waitForExpectations(timeout: 30, handler: nil)
    }

    func test_HTTPRequester_Get_WithQueryParams_And_Headers() {
        //Given
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        let queryParams = ["userId": 1]
        let expectedStatusCode = 200
        let requestExpectation = expectation(description: "Run HTTP Request")
        let headers = ["Accept": "application/json"]

        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: url,
                                              queryParams: queryParams)
            httpRequest.headers = headers

            HTTPRequester.execute(httpRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                //Then
                if let _ = error {
                    XCTFail("Expected the request not to fail")
                } else {
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    let code = (response as! HTTPURLResponse).statusCode

                    XCTAssertTrue(responseString != nil, "Expected the response string not to be empty")
                    XCTAssertTrue(code == expectedStatusCode, "Expected status code to be \(expectedStatusCode)")
                }

                requestExpectation.fulfill()
            }
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }

        waitForExpectations(timeout: 30, handler: nil)
    }


    func test_HTTPRequester_Post_WithBody() {
        //Given
        let url = "https://jsonplaceholder.typicode.com/posts/"
        let jsonBody: [String: AnyHashable] = ["title": "foo", "body": "bar", "userId": 1]
        let expectedStatusCode = 201
        let requestExpectation = expectation(description: "Run HTTP Request")

        //When
        do {
            let httpRequest = try HTTPRequest(method: .Post,
                                              url: url)
            httpRequest.body = jsonBody

            HTTPRequester.execute(httpRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                //Then
                if let _ = error {
                    XCTFail("Expected the request not to fail")
                } else {
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    let code = (response as! HTTPURLResponse).statusCode

                    XCTAssertTrue(responseString != nil, "Expected the response string not to be empty")
                    XCTAssertTrue(code == expectedStatusCode, "Expected status code to be \(expectedStatusCode)")
                }

                requestExpectation.fulfill()
            }
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }

        waitForExpectations(timeout: 30, handler: nil)
    }
}
