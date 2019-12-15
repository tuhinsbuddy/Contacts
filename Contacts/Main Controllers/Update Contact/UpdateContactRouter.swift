//
//  UpdateContactRouter.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import UIKit

final class UpdateContactRouter: UpdateContactWireframeProtocol {
    weak var viewController: UIViewController?
    static func show(on view: UIViewController, for type: ViewType, with data: Contact) {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardName.contacts.rawValue, bundle: nil)
        guard let update = storyboard.instantiateViewController(withIdentifier: "UpdateContactViewController") as? UpdateContactViewController else { return }
        let interactor: UpdateContactInteractor = UpdateContactInteractor()
        let router: UpdateContactRouter = UpdateContactRouter()
        let presenter: UpdateContactPresenter = UpdateContactPresenter(interface: update, interactor: interactor, router: router, for: type)
        update.presenterOutput = presenter
        interactor.interactorOutput = presenter
        router.viewController = view
        //Thread chcker to ensure in which thread the app is running now and avoid forecefully running on main thread, well blindly!
        switch Thread.isMainThread {
        case true:
            view.show(update, sender: view)
        case false:
            DispatchQueue.main.async {
                view.show(update, sender: view)
            }
        }
    }
}
