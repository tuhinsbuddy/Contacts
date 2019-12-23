//
//  BaseTableViewCell.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

final class BaseTableViewCell: UITableViewCell {
    @IBOutlet weak var baseSuperView: UIView!
    @IBOutlet weak var profileImageSuperView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var favouriteSuperView: UIView!
    @IBOutlet weak var favouriteImageView: UIImageView!
    @IBOutlet weak var selectContactBtn: UIButton!
    public weak var delegate: BaseTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        selectContactBtn.setTitle(nil, for: .normal)
        setColors()
        guard selectContactBtn.allTargets.isEmpty else {
            return
        }
        selectContactBtn.addTarget(self, action: #selector(onClicked(sender:)), for: .touchUpInside)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        profileImageSuperView.layer.cornerRadius = 20
        profileImageSuperView.clipsToBounds = true
    }
}
