//
//  BaseRouter.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import UIKit

final class BaseRouter: BaseWireframeProtocol {
    weak var viewController: UIViewController?
    static func build() -> BaseViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardName.contacts.rawValue, bundle: nil)
        guard let base = storyboard.instantiateViewController(withIdentifier: "BaseViewController") as? BaseViewController else { return nil }
        let interactor: BaseInteractor = BaseInteractor()
        let router: BaseRouter = BaseRouter()
        let presenter: BasePresenter = BasePresenter(interface: base, interactor: interactor, router: router)
        base.presenterOutput = presenter
        interactor.interactorOutput = presenter
        router.viewController = base
        return base
    }
}
