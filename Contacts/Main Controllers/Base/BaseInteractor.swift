//
//  BaseInteractor.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import Foundation

final class BaseInteractor: BaseInteractorInputProtocol {
    weak var interactorOutput: BaseInteractorOutputProtocol?
    func getData() {
        let requestApi: String = ContactsApis.baseUrl + ContactsApis.contacts + ContactsApiQueries.json
        //"\(ContactsApis.baseUrl)\(ContactsApis.contacts)\(ContactsApiQueries.json)"
        debugPrint(requestApi)
        debugPrint("http://gojek-contacts-app.herokuapp.com/contacts.json")
        ContactsRequestEngine.shared.request(fromApi: "http://gojek-contacts-app.herokuapp.com/contacts.json", method: .get, header: [:]) { [weak self] (response) in
            guard let self = self else { return }
            self.interactorOutput?.baseResponse(with: response)
        }
    }
}
