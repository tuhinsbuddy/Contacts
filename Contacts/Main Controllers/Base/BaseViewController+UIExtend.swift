//
//  BaseViewController+UIExtend.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

extension BaseViewController: BaseViewProtocol {
    func loadLayout() {
        
    }
    func viewLoad() {
        baseTableView.register(UINib(nibName: "BaseTableViewCell", bundle: nil), forCellReuseIdentifier: "BaseTableViewCell")
        baseTableView.register(UINib(nibName: "LoaderTableViewCell", bundle: nil), forCellReuseIdentifier: "LoaderTableViewCell")
        if #available(iOS 13.0, *) {
            baseTableView.backgroundColor = .systemBackground
        } else {
            baseTableView.backgroundColor = .white
        }
        baseTableView.separatorStyle = .none
        baseTableView.showsHorizontalScrollIndicator = false
        baseTableView.showsVerticalScrollIndicator = false
        baseTableView.delegate = self
        baseTableView.dataSource = self
        baseTableView.tableFooterView = UIView(frame: .zero)
        baseTableView.sectionFooterHeight = 0
        baseTableView.contentInset.bottom = 30
    }
    func reloadData() {
        switch Thread.isMainThread {
        case true:
            baseTableView.reloadData()
        case false:
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.baseTableView.reloadData()
            }
        }
    }
}
