//
//  UpdateContactProtocols.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import Foundation

//MARK: Wireframe -
protocol UpdateContactWireframeProtocol: class {
    //Write all Wireframe Protocols Here.
}

//MARK: Presenter -
protocol UpdateContactPresenterProtocol: class {
    //Write all Presenter Protocols Here.
    var interactorInput: UpdateContactInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol UpdateContactInteractorOutputProtocol: class {
    /* Interactor -> Presenter */
}

protocol UpdateContactInteractorInputProtocol: class {
    var interactorOutput: UpdateContactInteractorOutputProtocol?  { get set }
    /* Presenter -> Interactor */
}

//MARK: View -
protocol UpdateContactViewProtocol: class {
    var presenterOutput: UpdateContactPresenterProtocol?  { get set }
    /* Presenter -> ViewController */
}
