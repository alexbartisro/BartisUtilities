//
//  HTTPRequest.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 07/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation

//MARK - HTTPRequest
open class HTTPRequest {
    public private(set) var method: Method!
    public private(set) var url: URL!
    public private(set) var loginString = ""
    public private(set) var queryParams = [String: AnyHashable]()

    public var headers = [String: String]()
    public var urlString: String {
        return url.absoluteString
    }

    public var body: [String: AnyHashable]?
    public var identifier = ""
    public var httpBody: Data? {
        if let unwrappedBody = body {
            return try? JSONSerialization.data(withJSONObject: unwrappedBody)
        }

        return nil
    }

    /// Initializer for a HTTPRequest object
    ///
    /// - Parameters:
    ///   - method: HTTP Method to use
    ///   - url: String describing the url
    ///   - username: String describing the username (Optional - defaults to nil)
    ///   - password: String describing the password (Optional - defaults to nil)
    ///   - queryParams: Dictionary containing the query params, as [Parameter: Value] (Optional - defaults to nil)
    public init(method: Method, url: String, username: String? = nil, password: String? = nil, queryParams: [String: AnyHashable]? = nil) throws {
        guard let unwrappedURL = createUrlFrom(url: url, queryParams: queryParams) else { throw HTTPRequestError.URLInvalidError }

        self.method = method
        self.url = unwrappedURL
        self.loginString = createLoginStringFrom(username: username, password: password)
    }

    private func createUrlFrom(url: String, queryParams: [String: AnyHashable]? = nil) -> URL? {
        var newUrl = url
        if let params = queryParams?.queryString {
            newUrl = url + params
        }

        return URL(string: newUrl)
    }

    private func createLoginStringFrom(username: String?, password: String?) -> String {
        if let unwrappedUsername = username, let unwrappedPassord = password {
            let loginString = NSString(format: "%@:%@", unwrappedUsername, unwrappedPassord)
            if let loginData = loginString.data(using: String.Encoding.ascii.rawValue) {
                return loginData.base64EncodedString()
            }
        }

        return ""
    }
}

//MARK - Method
public enum Method: String {
    case Get = "GET"
    case Put = "PUT"
    case Post = "POST"
    case Delete = "DELETE"
    case Patch = "PATCH"
}

//MARK - HTTPRequestError
public enum HTTPRequestError: Error {
    case URLInvalidError
}

extension HTTPRequestError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .URLInvalidError:
            return NSLocalizedString("Fatal error - URL is invalid", comment: "")
        }
    }
}
