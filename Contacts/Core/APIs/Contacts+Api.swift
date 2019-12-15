//
//  Contacts+Api.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

public struct ContactsApis {
    private init() {}
    public static let base : String = "​http://gojek-contacts-app.herokuapp.com"
    public static var baseUrl: String {
        #if DEBUG
            return "​http://gojek-contacts-app.herokuapp.com"
        #else
            return "​http://gojek-contacts-app.herokuapp.com" //Change accordingly for productions base url
        #endif
    }
    public static let contacts: String = "/contacts"
}

