//
//  BaseViewController.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import UIKit

final class BaseViewController: UIViewController {
    @IBOutlet weak var baseTableView: UITableView!
	var presenterOutput: BasePresenterProtocol?
    override func loadView() {
        super.loadView()
        presenterOutput?.loadView()
    }
}
