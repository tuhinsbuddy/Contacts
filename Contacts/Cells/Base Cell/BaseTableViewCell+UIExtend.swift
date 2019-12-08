//
//  BaseTableViewCell+UIExtend.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

extension BaseTableViewCell {
    func setColors() {
        if #available(iOS 13.0, *) {
            profileNameLbl.textColor = UIColor.label
        } else {
            profileNameLbl.textColor = .titleTextColor
        }
    }
}
