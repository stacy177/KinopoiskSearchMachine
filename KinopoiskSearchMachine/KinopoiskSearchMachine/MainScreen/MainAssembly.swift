//
//  MainAssembly.swift
//

import UIKit

enum MainAssembly {
    static func build() -> UIViewController {
        let presenter = MainPresenter()
        let worker = MainWorker()
        let interactor = MainInteractor(presenter: presenter, worker: worker)
        let router = MainRouter(dataStore: interactor)
        let viewController = MainViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
