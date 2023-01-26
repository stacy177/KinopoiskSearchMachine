//
//  GenreSearchAssembly.swift
//

import UIKit

enum GenreSearchAssembly {
    static func build() -> UIViewController {
        let presenter = GenreSearchPresenter()
        let worker = GenreSearchWorker()
        let interactor = GenreSearchInteractor(presenter: presenter, worker: worker)
        let router = GenreSearchRouter(dataStore: interactor)
        let viewController = GenreSearchViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
