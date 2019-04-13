//
//  HTTPResponse.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 28/10/2018.
//  Copyright © 2018 Alex Bartis. All rights reserved.
//

import Foundation

public struct HTTPResponse {
    public var statusCode: Int
    public var data: Data?
    public var headerFields: [AnyHashable : Any]
}
