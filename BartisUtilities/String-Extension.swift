//
//  String-Extension.swift
//  FSXUtils
//
//  Created by Alex Bartis on 27/03/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation

public extension String {

    ///http://stackoverflow.com/a/24144365/2984775

    /// Returns a truncated string based on an input leght
    /// and finished with a given trailing string
    /// - Parameters:
    ///   - length: Int describing the lenght for the string to be truncated at
    ///   - trailing: String describing how to end the truncated text
    /// - Returns: A truncated string finishing with a given string
    func trunc(length: Int, trailing: String = "...") -> String {
        if self.characters.count > length {
            let endIndex = self.index(self.startIndex, offsetBy: length)
            return self[self.startIndex..<endIndex] + trailing
        }

        return self
    }

    /// Returns the character at index i in a string
    ///
    /// - Parameter i: Int describing the index for the character to be returned
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

    /// Returns the character at index i in a string, as a String
    ///
    /// - Parameter i: Int describing the index for the character to be returned
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    /// URL from string
    ///
    /// - Returns: URL
    func url() -> URL {
        guard let url = URL(string: self) else {
            return NSURLComponents().url!
        }

        return url
    }
}
