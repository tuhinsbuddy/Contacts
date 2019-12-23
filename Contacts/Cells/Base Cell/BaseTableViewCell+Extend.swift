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
    @objc internal func onClicked(sender: UIButton) {
        let index: IndexPath = IndexPath(row: sender.tag, section: self.tag)
        debugPrint("Index is - \(index)")
        delegate?.didSelectContact(sender: sender, withIndex: index)
    }
    public func setup(with data: Contact, andIndex index: IndexPath) {
        self.tag = index.section
        selectContactBtn.tag = index.row
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
        profileNameLbl.font = data.firstNameTextFont
        profileNameLbl.numberOfLines = data.firstNameTextNumberOfLines
    }
}
protocol BaseTableViewCellDelegate: class {
    func didSelectContact(sender on: UIButton, withIndex index: IndexPath)
}
