//
//  HTTPRequesterHelpers.swift
//  BartisUtilitiesTests
//
//  Created by Alex Bartis on 28/10/2018.
//  Copyright © 2018 Alex Bartis. All rights reserved.
//

import Foundation
import XCTest
import BartisUtilities

class HTTPRequesterDelegateStub: HTTPRequesterDelegate {
    var didReceiveResponse = false
    var didReceiveError = false
    var requestExpectation: XCTestExpectation!
    
    
    func didReceive(_ response: HTTPResponse) {
        didReceiveResponse = true
        requestExpectation.fulfill()
    }
    
    func didReceive(_ error: Error) {
        didReceiveError = true
        requestExpectation.fulfill()
    }
}
