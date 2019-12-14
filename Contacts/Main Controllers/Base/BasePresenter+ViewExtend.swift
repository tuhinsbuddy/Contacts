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
            var allContacts: [Contacts] = []
            rawData.forEach { (current) in
                let contact: Contacts = Contacts(with: current)
                if let firstChar = contact.firstName.first, !sectionHeaders.contains(firstChar.description) {
                    sectionHeaders.append(firstChar.description)
                }
                if !contact.firstName.isEmpty {
                    allContacts.append(contact)
                }
            }
            allContacts = allContacts.sorted(by: { $0.firstName.lowercased() < $1.firstName.lowercased() })
            sectionHeaders = sectionHeaders.sorted(by: { $0.lowercased() < $1.lowercased() })
            view?.reloadData()
        default: break //Can be customized and show some error if required
        }
    }
}
