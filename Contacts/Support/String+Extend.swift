//
//  String+Extend.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

public extension String {
    var toDate: Date {
        let baseFormatter: DateFormatter = DateFormatter()
        baseFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSzZ"
        guard let response = baseFormatter.date(from: self) else { return Date() }
        return response
    }
}
