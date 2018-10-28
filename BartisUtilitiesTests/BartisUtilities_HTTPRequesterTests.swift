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
        
        HTTPRequester.delegate = nil
    }
    
    func test_HTTPRequester_Get_WithQueryParams() {
        //Given
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        let queryParams = ["userId": 1]
        let requesterDelegate = HTTPRequesterDelegateStub()
        let requestExpectation = XCTestExpectation(description: "Run request")
        
        requesterDelegate.requestExpectation = requestExpectation
        
        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: url,
                                              queryParams: queryParams)
            
            HTTPRequester.delegate = requesterDelegate
            HTTPRequester.execute(httpRequest)
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }
        
        wait(for: [requestExpectation], timeout: 30)
        
        XCTAssertTrue(requesterDelegate.didReceiveResponse, "Expected to receive the response")
    }
    
    func test_HTTPRequester_Get_WithQueryParams_And_Credentials() {
        //Given
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        let queryParams = ["userId": 1]
        let requesterDelegate = HTTPRequesterDelegateStub()
        let requestExpectation = XCTestExpectation(description: "Run request")
        
        requesterDelegate.requestExpectation = requestExpectation
        
        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: url,
                                              username: "test",
                                              password: "test",
                                              queryParams: queryParams)
            
            HTTPRequester.delegate = requesterDelegate
            HTTPRequester.execute(httpRequest)
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }
        
        wait(for: [requestExpectation], timeout: 30)
        
        XCTAssertTrue(requesterDelegate.didReceiveResponse, "Expected to receive the response")
    }
    
    func test_HTTPRequester_Get_WithQueryParams_And_Headers() {
        //Given
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        let queryParams = ["userId": 1]
        let headers = ["Accept": "application/json"]
        let requesterDelegate = HTTPRequesterDelegateStub()
        let requestExpectation = XCTestExpectation(description: "Run request")
        
        requesterDelegate.requestExpectation = requestExpectation
        
        //When
        do {
            let httpRequest = try HTTPRequest(method: .Get,
                                              url: url,
                                              queryParams: queryParams)
            httpRequest.headers = headers
            
            HTTPRequester.delegate = requesterDelegate
            HTTPRequester.execute(httpRequest)
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }
        
        wait(for: [requestExpectation], timeout: 30)
        
        XCTAssertTrue(requesterDelegate.didReceiveResponse, "Expected to receive the response")
    }
    
    
    func test_HTTPRequester_Post_WithBody() {
        //Given
        let url = "https://jsonplaceholder.typicode.com/posts/"
        let jsonBody: [String: AnyHashable] = ["title": "foo", "body": "bar", "userId": 1]
        let requesterDelegate = HTTPRequesterDelegateStub()
        let requestExpectation = XCTestExpectation(description: "Run request")
        
        requesterDelegate.requestExpectation = requestExpectation
        
        //When
        do {
            let httpRequest = try HTTPRequest(method: .Post,
                                              url: url)
            httpRequest.body = jsonBody
            
            HTTPRequester.delegate = requesterDelegate
            HTTPRequester.execute(httpRequest)
        } catch {
            XCTFail("Error thrown \(error.localizedDescription)")
        }
        
        wait(for: [requestExpectation], timeout: 30)
        
        XCTAssertTrue(requesterDelegate.didReceiveResponse, "Expected to receive the response")
    }
}
