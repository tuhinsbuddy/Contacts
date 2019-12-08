//
//  Enums.swift
//  Contacts
//
//  Created by Tuhin on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

public enum ResponseType: String {
    case error, empty, apiEmpty
    case success, nointernet, undefined
}
public enum ViewType: String {
    case base, details, edit, update
}
public enum StoryboardName: String {
    case contacts = "Contacts"
    case launch = "LaunchScreen"
}
public enum UICellType {
    case loader, base, edit, delete
}
public enum RequestMethod: String {
    case options = "OPTIONS"
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case trace = "TRACE"
    case connect = "CONNECT"
}
