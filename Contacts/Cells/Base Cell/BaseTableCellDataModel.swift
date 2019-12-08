//
//  BaseTableCellDataModel.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

public final class BaseTableCellDataModel {
    let imageURL: String
    let title: String
    var titleTextColor: UIColor
    var titleTextFont: UIFont
    var titleTextAlignment: NSTextAlignment
    var titleTextNumberOfLines: Int
    var titleTextFitSize: Bool
    let isFavourite: Bool
    init(with url: String, title ttl: String, and favourite: Bool) {
        self.imageURL = url
        self.title = ttl
        self.isFavourite = favourite
        if #available(iOS 13.0, *) {
            self.titleTextColor = UIColor.label
        } else {
            self.titleTextColor = .titleTextColor
        }
        self.titleTextFont = .systemFont(ofSize: 14)
        self.titleTextAlignment = .left
        self.titleTextNumberOfLines = 1
        self.titleTextFitSize = true
    }
}
