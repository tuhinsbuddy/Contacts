//
//  LoaderTableViewCell+UIExtend.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

extension LoaderTableViewCell {
    func loadViews() {
        if #available(iOS 13.0, *) {
            baseSuperView.backgroundColor = .systemBackground
            activityView.style = .large
        } else {
            baseSuperView.backgroundColor = .white
            activityView.style = .whiteLarge
        }
    }
}
