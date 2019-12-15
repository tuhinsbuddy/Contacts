//
//  BaseTableViewCell+Extend.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit
import Kingfisher

extension BaseTableViewCell {
    public func setup(with data: Contact) {
        if !data.profilePic.isEmpty {
            let finalUrl: String = ContactsApis.baseUrl + data.profilePic
            guard let profileImage: URL = URL(string: finalUrl) else { return }
            profileImageView.kf.indicatorType = .activity
            profileImageView.kf.setImage(
                with: profileImage,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
            ])
        }
        profileNameLbl.text = "\(data.firstName) \(data.lastName)"
    }
}
