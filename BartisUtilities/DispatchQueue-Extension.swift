//
//  DispatchQueue-Extension.swift
//  FSXUtils
//
//  Created by Alex Bartis on 07/02/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation

public extension DispatchQueue {

    /// http://stackoverflow.com/a/40997652/2984775
    /// Method that does something a background thread, then calls
    /// a completion after a delay
    ///
    /// - Parameters:
    ///   - delay: Double describing the duration to wait until calling the completion
    ///   - background: Closure describing what to run on the background thread
    ///   - completion: Closure called when the operation on the background thread finished
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
}
