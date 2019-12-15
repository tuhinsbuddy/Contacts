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
    public func setup(with data: Contacts) {
        if !data.profilePic.isEmpty,
            let profileImage: URL = URL(string: data.profilePic) {
            profileImageView.kf.indicatorType = .activity
            profileImageView.kf.setImage(
                with: profileImage,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
            ])
        }
        profileNameLbl.text = data.firstName + data.lastName
//        @IBOutlet weak var favouriteSuperView: UIView!
//        @IBOutlet weak var favouriteImageView: UIImageView!
    }
}
