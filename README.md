[![Build Status](https://travis-ci.org/trusk89/BartisUtilities.svg?branch=master)](https://travis-ci.org/trusk89/BartisUtilities)

# BartisUtilities

--------------------

BartisUtilities is an utility framework for my most frequest used stuff.

Current utilities:

### UIColor - Extension
    ```
    ///   Create an UIColor object based on a hex string
    ///
    /// - Parameter hexString: a hex string describing a color

    convenience init(hexString: String) { }
    ```

    ```
    /// Method that returns an UIColor in a hex string
    ///
    /// - Returns: UIColor hex String
    
    func toHexString() -> String { }
    ```

### String - Extension
    ```
    /// Returns a truncated string based on an input leght
    /// and finished with a given trailing string
    /// - Parameters:
    ///   - length: Int describing the lenght for the string to be truncated at
    ///   - trailing: String describing how to end the truncated text
    /// - Returns: A truncated string finishing with a given string
    func trunc(length: Int, trailing: String = "...") -> String { }
    ```

    ```
    /// Returns the character at index i in a string
    ///
    /// - Parameter i: Int describing the index for the character to be returned
    subscript (i: Int) -> Character { }
    ```

    ```
    /// Returns the character at index i in a string, as a String
    ///
    /// - Parameter i: Int describing the index for the character to be returned
    subscript (i: Int) -> String { }
    ```

### ThemableViews
Classes to be subclassed in order to set theming
without setting theming for a base SDK object

### PropertyLoopable
    ///
    /// Protocol describing a struct through who's properties you
    /// can loop through, to access both both property names and
    /// property value
    ///

    ```
    /// A method that returnts an array of strings which are the
    /// object's property names
    ///
    /// - Returns: An array of strings describing the object's properties
    func allProperties() -> [String] { }
    ```

    ```
    /// A method that returnts an array of strings which are the
    /// object's properties' value
    ///
    /// - Returns: An array of the object's property values
    func allValues() -> [String] { }
    ```

