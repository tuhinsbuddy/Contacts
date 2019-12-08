//
//  ContactsCommonProtocols.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import Foundation

public protocol ContactsParamRepresntable {
    var createParamRequest: [String: Any] { get }
    var updateParamRequest: [String: Any] { get }
}
