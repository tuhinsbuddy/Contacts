//
//  Date+Extend.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

public extension Date {
    var toString: String {
        let baseFormatter: DateFormatter = DateFormatter()
        baseFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSzZ"
        return baseFormatter.string(from: self)
    }
}
