//
//  Contacts+BaseResponse.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

public struct ContactsGenericResponse {
    let response: [String: Any]
    let httpStatusCode: Int
    let responseType: ResponseType
    let message: String
    init(withData data: [String: Any] = [:], withStatusCode code: Int = 200, withResponseType type: ResponseType = .success, message msg: String = ContactsStaticMessages.successful) {
        self.response = data
        self.httpStatusCode = code
        self.responseType = type
        self.message = msg
    }
}
