//
//  HTTPRequester.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 07/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation

public protocol HTTPRequesterDelegate: class {
    func didReceive(_ response: HTTPResponse)
    func didReceive(_ error: Error)
}

open class HTTPRequester {

    public static weak var delegate: HTTPRequesterDelegate?
    
    /// Method that executes a URLRequest based on an 
    /// a HTTPRequest object. Response is sent back to
    /// the delegate on the main thread
    ///
    /// - Parameters:
    ///   - request: HTTPRequest to be executed
    public static func execute(_ request: HTTPRequest) {
        var urlRequest = URLRequest(url: request.url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 120)
        urlRequest.httpMethod = request.method.rawValue

        if !request.loginString.isEmpty {
            urlRequest.setValue(request.loginString, forHTTPHeaderField: Headers.Authorization.rawValue)
        }

        if !request.headers.isEmpty {
            for header in request.headers {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }

        if request.httpBody != nil {
            urlRequest.httpBody = request.httpBody
        }

        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data: Data?, resp: URLResponse?, error: Error?) in
            NotificationCenter.default.post(Notification(name: requestDidStartNotification))
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                NotificationCenter.default.post(Notification(name: requestDidFinishNotification))
                
                if let error = error {
                    self.delegate?.didReceive(error)
                } else if let resp = resp as? HTTPURLResponse {
                    let response = HTTPResponse(statusCode: resp.statusCode, data: data, headerFields: resp.allHeaderFields, identifier: request.identifier)
                    self.delegate?.didReceive(response)
                }
            })
        })
        task.resume()
    }
}

// MARK: - Notifications

public let requestDidStartNotification = NSNotification.Name(rawValue: "RequestDidStart")
public let requestDidFinishNotification = NSNotification.Name(rawValue: "RequestDidFinish")

// MARK: - Headers

enum Headers: String {
    case Authorization = "Authorization"
}
