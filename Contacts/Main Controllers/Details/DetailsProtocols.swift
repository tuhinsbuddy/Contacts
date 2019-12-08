//
//  DetailsProtocols.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import Foundation

//MARK: Wireframe -
protocol DetailsWireframeProtocol: class {
    //Write all Wireframe Protocols Here.
}

//MARK: Presenter -
protocol DetailsPresenterProtocol: class {
    //Write all Presenter Protocols Here.
    var interactorInput: DetailsInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol DetailsInteractorOutputProtocol: class {
    /* Interactor -> Presenter */
}

protocol DetailsInteractorInputProtocol: class {
    var interactorOutput: DetailsInteractorOutputProtocol?  { get set }
    /* Presenter -> Interactor */
}

//MARK: View -
protocol DetailsViewProtocol: class {
    var presenterOutput: DetailsPresenterProtocol?  { get set }
    /* Presenter -> ViewController */
}
