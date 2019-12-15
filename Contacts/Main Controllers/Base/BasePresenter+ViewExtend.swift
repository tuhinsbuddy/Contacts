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
            var tempContacts: [Contacts] = []
            var lastHeader: String = ""
            var currentHeader: String = ""
            var baseData: [BaseCellDataModel] = []
            baseData.reserveCapacity(rawData.count)
            //Parsing the data and fetching the headers and data as per the response!
            rawData.forEach { (current) in
                let contact: Contacts = Contacts(with: current)
                if let firstChar = contact.firstName.first, !firstChar.description.isEmpty {
                    currentHeader = firstChar.description
                    if lastHeader.isEmpty { lastHeader = currentHeader }
                    if lastHeader != currentHeader {
                        sectionHeaders.append(lastHeader)
                        if tempContacts.count > 1 {
                            tempContacts = tempContacts.sorted(by: { $0.firstName.lowercased() < $1.firstName.lowercased() })
                        }
                        baseData.append(BaseCellDataModel(with: lastHeader, and: tempContacts))
                        tempContacts = [setUIPropeties(for: contact)]
                        lastHeader = currentHeader
                    } else {
                        tempContacts.append(setUIPropeties(for: contact))
                    }
                }
            }
            //Sorting both the headers and data
            sectionHeaders = sectionHeaders.sorted(by: { $0 < $1 })
            baseData = baseData.sorted(by: { $0.sectionHeader < $1.sectionHeader })
            //Finally converting all the data to the generic cell model structure
            tableData = baseData.map({ (model) -> ContactsGenericCell in
                return ContactsGenericCell(with: model, and: .base)
            })
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
