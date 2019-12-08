//
//  Contacts+RequestEngine.swift
//  Contacts
//
//  Created by Tuhin on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation
import Alamofire

final public class ContactsRequestEngine {
    private init() {}
    private static let single: ContactsRequestEngine = ContactsRequestEngine()
    public static var shared: ContactsRequestEngine { return single }
    func request(fromApi api: String, method: RequestMethod = .get, header head: [String: String]? = nil, parameters params: [String: Any]? = nil, onCompletion: ((_ response: ContactsGenericResponse) -> Void)? = nil) {
        guard !api.isEmpty else {
            let errorResponse: ContactsGenericResponse = ContactsGenericResponse(withStatusCode: 900, withResponseType: .apiEmpty, message: ContactsStaticMessages.apiEmpty)
            switch Thread.isMainThread {
            case true:
                onCompletion?(errorResponse)
            case false:
                DispatchQueue.main.async {
                    onCompletion?(errorResponse)
                }
            }
            return
        }
        
        Alamofire.request(api, method: method.rawValue.httpMethod, parameters: params, encoding: JSONEncoding.default, headers: head).responseJSON(completionHandler: { response in
            debugPrint("Request using Alamofire for - \(api) and the response is - \(response)")
            let statusCode: Int = response.response?.statusCode ?? 404
            if let errorC = response.result.error {
                let error: ContactsGenericResponse = ContactsGenericResponse(withStatusCode: statusCode, withResponseType: .error, message: errorC.localizedDescription)
                switch Thread.isMainThread {
                case true:
                    onCompletion?(error)
                case false:
                    DispatchQueue.main.async {
                        onCompletion?(error)
                    }
                }
            } else if let responseC = response.result.value as? [String: Any], !responseC.isEmpty {
                let success: ContactsGenericResponse = ContactsGenericResponse(withData: responseC, withStatusCode: statusCode, withResponseType: .success, message: ContactsStaticMessages.successful)
                switch Thread.isMainThread {
                case true:
                    onCompletion?(success)
                case false:
                    DispatchQueue.main.async {
                        onCompletion?(success)
                    }
                }
            } else {
                let error: ContactsGenericResponse = ContactsGenericResponse(withResponseType: .error, message: ContactsStaticMessages.somethingWrong)
                switch Thread.isMainThread {
                case true:
                    onCompletion?(error)
                case false:
                    DispatchQueue.main.async {
                        onCompletion?(error)
                    }
                }
            }
        })
    }
}

private extension String {
    var httpMethod: HTTPMethod {
        guard let method = HTTPMethod(rawValue: self) else { return .get }
        return method
    }
}
