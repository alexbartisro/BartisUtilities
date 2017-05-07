//
//  Dictionary-Extension.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 07/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation

public extension Dictionary where Key: Hashable, Value: Hashable {
    /// Property describing the dictionary as a query string
    var queryString: String? {

        var output = "?"
        for (index, pair) in self.enumerated() {
            if index == 0 {
                output = output.appending("\(pair.key)=\(pair.value)")
            } else {
                output = output.appending("&\(pair.key)=\(pair.value)")
            }
        }
        return output
    }
}
