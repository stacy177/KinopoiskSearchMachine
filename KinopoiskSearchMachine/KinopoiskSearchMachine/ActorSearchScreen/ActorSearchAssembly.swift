//
//  ActorSearchAssembly.swift
//

import UIKit

enum ActorSearchAssembly {
    static func build() -> UIViewController {
        let presenter = ActorSearchPresenter()
        let worker = ActorSearchWorker()
        let interactor = ActorSearchInteractor(presenter: presenter, worker: worker)
        let router = ActorSearchRouter(dataStore: interactor)
        let viewController = ActorSearchViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
