//
//  LoaderTableViewCell.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

final class LoaderTableViewCell: UITableViewCell {
    @IBOutlet weak var baseSuperView: UIView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        loadViews()
        if !activityView.isAnimating {
            activityView.startAnimating()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
