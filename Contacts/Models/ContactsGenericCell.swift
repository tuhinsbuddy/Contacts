//
//  ContactsGenericCell.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

public struct ContactsGenericCell {
    let cellType: UICellType
    let data: Any
    init(with data: [String: Any] = [:], and type: UICellType = .loader) {
        self.cellType = type
        self.data = data
    }
}
