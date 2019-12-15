//
//  BaseCellDataModel.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

public final class BaseCellDataModel {
    let sectionHeader: String
    let sectionRow: [Contact]
    init(with header: String, and row: [Contact]) {
        self.sectionHeader = header
        self.sectionRow = row
    }
}
