//
//  DetailsRouter.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.

import UIKit

final class DetailsRouter: DetailsWireframeProtocol {
    weak var viewController: UIViewController?
    static func show(on view: UIViewController, for data: Contacts) {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardName.contacts.rawValue, bundle: nil)
        guard let details = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        let interactor: DetailsInteractor = DetailsInteractor()
        let router: DetailsRouter = DetailsRouter()
        let presenter: DetailsPresenter = DetailsPresenter(interface: details, interactor: interactor, router: router)
        details.presenterOutput = presenter
        interactor.interactorOutput = presenter
        router.viewController = view
        //Thread chcker to ensure in which thread the app is running now and avoid forecefully running on main thread, well blindly!
        switch Thread.isMainThread {
        case true:
            view.show(details, sender: view)
        case false:
            DispatchQueue.main.async {
                view.show(details, sender: view)
            }
        }
    }
}
