//
//  UITableView+Extend.swift
//  Contacts
//
//  Created by Tuhin on 22/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

public extension UITableView {
    func getIndex(fromSender sender: UIButton) -> IndexPath? {
        let table: UITableView = self
        let position: CGPoint = sender.convert(CGPoint.zero, to: table)
        guard let index =  table.indexPathForRow(at: position) else { return nil }
        return index
    }
}
