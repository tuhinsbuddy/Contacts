//
//  UpdateContactPresenter.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import UIKit

final class UpdateContactPresenter: UpdateContactPresenterProtocol {
    weak private var view: UpdateContactViewProtocol?
    var interactorInput: UpdateContactInteractorInputProtocol?
    private let router: UpdateContactWireframeProtocol
    private var viewType: ViewType = .edit
    init(interface: UpdateContactViewProtocol, interactor: UpdateContactInteractorInputProtocol?,
         router: UpdateContactWireframeProtocol, for type: ViewType) {
        self.view = interface
        self.interactorInput = interactor
        self.router = router
        self.viewType = type
    }
}

extension UpdateContactPresenter: UpdateContactInteractorOutputProtocol {}
