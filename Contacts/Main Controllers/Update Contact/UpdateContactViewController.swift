//
//  UpdateContactViewController.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import UIKit

class UpdateContactViewController: UIViewController {
	var presenterOutput: UpdateContactPresenterProtocol?
    override func loadView() {
        super.loadView()
    }
	override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UpdateContactViewController: UpdateContactViewProtocol {}
