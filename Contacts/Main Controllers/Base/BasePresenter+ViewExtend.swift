//
//  BasePresenter+ViewExtend.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

extension BasePresenter: BaseInteractorOutputProtocol {
    func baseResponse(with data: ContactsGenericResponse) {
        switch data.httpStatusCode {
        case 200:
            guard let rawData = data.response as? [[String: Any]], !rawData.isEmpty else { return }
            tableData = []
            var allContacts: [Contacts] = []
            rawData.forEach { (current) in
                let contact: Contacts = Contacts(with: current)
                if !contact.firstName.isEmpty {
                    allContacts.append(setUIPropeties(for: contact))
                }
                if let firstChar = contact.firstName.first,
                    !sectionHeaders.contains(firstChar.description) {
                    sectionHeaders.append(firstChar.description)
                    sectionHeaders = sectionHeaders.sorted(by: { $0.lowercased() < $1.lowercased() })
                    allContacts = allContacts.sorted(by: { $0.firstName.lowercased() < $1.firstName.lowercased() })
                    tableData.append(ContactsGenericCell(with: BaseCellDataModel(with: firstChar.description, and: allContacts), and: .base))
                    allContacts = []
                }
            }
        default: break //Can be customized and show some error if required
        }
        view?.reloadData()
    }
}

private extension BasePresenter {
    func setUIPropeties(for contact: Contacts) -> Contacts {
        contact.firstNameTextColor = .titleTextColor
        contact.firstNameTextFont = .boldSystemFont(ofSize: 14)
        contact.firstNameTextAlignment = .left
        contact.firstNameTextNumberOfLines = 1
        contact.firstNameTextFitSize = true
        contact.lastNameTextColor = .titleTextColor
        contact.lastNameTextFont = .boldSystemFont(ofSize: 14)
        contact.lastNameTextAlignment = .left
        contact.lastNameTextNumberOfLines = 1
        contact.lastNameTextFitSize = true
        return contact
    }
}
