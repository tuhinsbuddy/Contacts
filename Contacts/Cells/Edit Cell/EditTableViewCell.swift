//
//  EditTableViewCell.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

final class EditTableViewCell: UITableViewCell {
    @IBOutlet weak var baseSuperView: UIView!
    @IBOutlet weak var baseStackView: UIStackView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailsTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
