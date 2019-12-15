//
//  BaseProtocols.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import Foundation

//MARK: Wireframe -
protocol BaseWireframeProtocol: class {
    //Write all Wireframe Protocols Here.
    func showDetails(for data: Contact)
}

//MARK: Presenter -
protocol BasePresenterProtocol: class {
    //Write all Presenter Protocols Here.
    var interactorInput: BaseInteractorInputProtocol? { get set }
    var tableData: [ContactsGenericCell] { get }
    var sectionHeaders: [String] { get }
    func loadView()
    func viewDidLayoutSubViews()
    func selectData(for index: IndexPath)
}

//MARK: Interactor -
protocol BaseInteractorInputProtocol: class {
    var interactorOutput: BaseInteractorOutputProtocol?  { get set }
    func getData()
}
protocol BaseInteractorOutputProtocol: class {
    func baseResponse(with data: ContactsGenericResponse)
}

//MARK: View -
protocol BaseViewProtocol: class {
    var presenterOutput: BasePresenterProtocol?  { get set }
    func viewLoad()
    func loadLayout()
    func reloadData()
}
