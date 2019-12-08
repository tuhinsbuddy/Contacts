//
//  DetailsPresenter.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import UIKit

final class DetailsPresenter: DetailsPresenterProtocol {
    weak private var view: DetailsViewProtocol?
    var interactorInput: DetailsInteractorInputProtocol?
    private let router: DetailsWireframeProtocol

    init(interface: DetailsViewProtocol, interactor: DetailsInteractorInputProtocol?, router: DetailsWireframeProtocol) {
        self.view = interface
        self.interactorInput = interactor
        self.router = router
    }
}

extension DetailsPresenter: DetailsInteractorOutputProtocol {}
