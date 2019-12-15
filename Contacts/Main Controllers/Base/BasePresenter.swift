//
//  BasePresenter.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import UIKit

final class BasePresenter: BasePresenterProtocol {
    weak internal var view: BaseViewProtocol?
    private let router: BaseWireframeProtocol
    private var layoutDone: Bool = false
    var interactorInput: BaseInteractorInputProtocol?
    var tableData: [ContactsGenericCell] = [ContactsGenericCell()]
    var sectionHeaders: [String] = []
    init(interface: BaseViewProtocol, interactor: BaseInteractorInputProtocol?, router: BaseWireframeProtocol) {
        self.view = interface
        self.interactorInput = interactor
        self.router = router
    }
    func loadView() {
        view?.viewLoad()
        interactorInput?.getData()
    }
    func viewDidLayoutSubViews() {
        guard !layoutDone else { return }
        layoutDone = false
        view?.loadLayout()
    }
}
extension BasePresenter {
    func selectData(for index: IndexPath) {
        guard !tableData.isEmpty,
            let data = tableData[index.section].data as? BaseCellDataModel,
            !data.sectionRow.isEmpty else { return }
        router.showDetails(for: data.sectionRow[index.row])
    }
}
