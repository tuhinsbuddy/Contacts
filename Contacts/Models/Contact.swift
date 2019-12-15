//
//  Contact.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

final public class Contact {
    let id: Int
    let firstName: String
    var firstNameTextColor: UIColor
    var firstNameTextFont: UIFont
    var firstNameTextAlignment: NSTextAlignment
    var firstNameTextNumberOfLines: Int
    var firstNameTextFitSize: Bool
    let lastName: String
    var lastNameTextColor: UIColor
    var lastNameTextFont: UIFont
    var lastNameTextAlignment: NSTextAlignment
    var lastNameTextNumberOfLines: Int
    var lastNameTextFitSize: Bool
    var profilePic: String
    var favourite: Bool
    let jsonURL: String
    var email: String
    var phoneNumber: String
    let createdAt: Date
    public init(with data: [String: Any]) {
        if let idC = data[ContactsParams.id] as? Int {
            id = idC
        } else {
            id = 0
        }
        if let firstNameC = data[ContactsParams.firstName] as? String,
            !firstNameC.isEmpty {
            firstName = firstNameC.capitalized
        } else {
            firstName = ""
        }
        if let lastNameC = data[ContactsParams.lastName] as? String,
            !lastNameC.isEmpty {
            lastName = lastNameC.capitalized
        } else {
            lastName = ""
        }
        if let profilePicC = data[ContactsParams.profilePic] as? String,
            !profilePicC.isEmpty {
            profilePic = profilePicC
        } else {
            profilePic = ""
        }
        if let favouriteC = data[ContactsParams.favourite] as? Bool {
            favourite = favouriteC
        } else {
            favourite = false
        }
        if let json = data[ContactsParams.url] as? String,
            !json.isEmpty {
            jsonURL = json
        } else {
            jsonURL = ""
        }
        if let emailC = data[ContactsParams.email] as? String,
            !emailC.isEmpty {
            email = emailC
        } else {
            email = ""
        }
        if let phoneNumberC = data[ContactsParams.phoneNumber] as? String,
            !phoneNumberC.isEmpty {
            phoneNumber = phoneNumberC
        } else {
            phoneNumber = ""
        }
        if let created = data[ContactsParams.createdAt] as? String,
            !created.isEmpty {
            createdAt = created.toDate
        } else {
            createdAt = Date()
        }
        firstNameTextColor = .titleTextColor
        firstNameTextFont = .systemFont(ofSize: 14)
        firstNameTextAlignment = .left
        firstNameTextNumberOfLines = 1
        firstNameTextFitSize = true
        lastNameTextColor = .titleTextColor
        lastNameTextFont = .systemFont(ofSize: 14)
        lastNameTextAlignment = .left
        lastNameTextNumberOfLines = 1
        lastNameTextFitSize = true
    }
}

extension Contact: ContactsParamRepresntable {
    public var createParamRequest: [String : Any] {
        return [ContactsParams.id: self.id,
                ContactsParams.firstName: self.firstName,
                ContactsParams.lastName: self.lastName,
                ContactsParams.email: self.email,
                ContactsParams.phoneNumber: self.phoneNumber,
                ContactsParams.profilePic: self.profilePic,
                ContactsParams.favourite: self.favourite,
                ContactsParams.createdAt: Date().toString,
                ContactsParams.updatedAt: Date().toString]
    }
    public var updateParamRequest: [String : Any] {
        return [ContactsParams.firstName: self.firstName,
                ContactsParams.lastName: self.lastName,
                ContactsParams.email: self.email,
                ContactsParams.phoneNumber: self.phoneNumber,
                ContactsParams.profilePic: self.profilePic,
                ContactsParams.favourite: self.favourite,
                ContactsParams.createdAt: self.createdAt.toString,
                ContactsParams.updatedAt: Date().toString]
    }
}
