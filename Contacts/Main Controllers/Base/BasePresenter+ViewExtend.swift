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
            var tempContacts: [Contact] = []
            tempContacts.reserveCapacity(rawData.count)
            var lastHeader: String = ""
            var currentHeader: String = ""
            //Parsing the data and fetching the headers and data as per the response!
            tempContacts = rawData.map({ (rawData) -> Contact in
                let contact: Contact = Contact(with: rawData)
                return setUIPropeties(for: contact)
            })
            tempContacts = tempContacts.sorted(by: { $0.firstName < $1.firstName })
            tempContacts.forEach { (contact) in
                if let firstChar = contact.firstName.first, !firstChar.description.isEmpty {
                    currentHeader = firstChar.description
                    if lastHeader.isEmpty { lastHeader = currentHeader }
                    if lastHeader != currentHeader {
                        sectionHeaders.append(lastHeader)
                        if tempContacts.count > 1 {
                            tempContacts = tempContacts.sorted(by: { $0.firstName.lowercased() < $1.firstName.lowercased() })
                        }
                        tableData.append(ContactsGenericCell(with: BaseCellDataModel(with: lastHeader, and: tempContacts), and: .base))
                        lastHeader = currentHeader
                    } else {
                        tempContacts.append(setUIPropeties(for: contact))
                    }
                }
            }
        default: break //Can be customized and show some error if required
        }
        view?.reloadData()
    }
}

private extension BasePresenter {
    func setUIPropeties(for contact: Contact) -> Contact {
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
