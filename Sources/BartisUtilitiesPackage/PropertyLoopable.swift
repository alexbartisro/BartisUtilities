//
//  PropertyLoopable.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 06/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation

///
/// Protocol describing a struct through who's properties you
/// can loop through, to access both both property names and
/// property value
///

public protocol PropertyLoopable {
    func allProperties() throws -> [String]
    func allValues() throws -> [String]
}

public extension PropertyLoopable {
    /// A method that returnts an array of strings which are the
    /// object's property names
    ///
    /// - Returns: An array of strings describing the object's properties
    func allProperties() -> [String] {
        return Mirror(reflecting: self).children.compactMap { $0.label }
    }

    /// A method that returnts an array of strings which are the
    /// object's properties' value
    ///
    /// - Returns: An array of the object's property values
    func allValues() -> [String] {
        return Mirror(reflecting: self).children.compactMap { $0.value as? String }
    }
}
