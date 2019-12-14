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
    let sectionRow: [Contacts]
//    let imageURL: String
//    let title: String
//    var titleTextColor: UIColor
//    var titleTextFont: UIFont
//    var titleTextAlignment: NSTextAlignment
//    var titleTextNumberOfLines: Int
//    var titleTextFitSize: Bool
//    let isFavourite: Bool
    init(with header: String, and row: [Contacts]) {
        self.sectionHeader = header
        self.sectionRow = row
    }
}
