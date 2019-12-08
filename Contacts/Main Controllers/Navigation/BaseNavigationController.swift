//
//  BaseNavigationController.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    override func loadView() {
        super.loadView()
//        self.navigationBar.barTintColor = .appPrimaryColor
//        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTitleTextColor]
//        self.navigationBar.tintColor = .appPrimaryColor
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard #available(iOS 13, *) else { return .default }
        return .darkContent
    }
}
