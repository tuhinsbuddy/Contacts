//
//  BasePresenter+ViewExtend.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

extension BasePresenter: BaseInteractorOutputProtocol {
    func baseResponse(with data: ContactsGenericResponse) {
        switch data.httpStatusCode {
        case 200:
            guard let rawData = data.response as? [[String: Any]], !rawData.isEmpty else { return }
            rawData.forEach { (current) in
                let contact: Contacts = Contacts(with: current)
                debugPrint(contact.firstName, contact.lastName, contact.email, contact.favourite)
                let baseCellData: BaseTableCellDataModel = BaseTableCellDataModel(with: contact.profilePic, title: contact.firstName + contact.lastName, and: contact.favourite)
                tableData.append(ContactsGenericCell(with: baseCellData, and: .base))
            }
            view?.reloadData()
        default: break //Can be customized and show some error if required
        }
    }
}
