//
//  GenreSearchAssembly.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
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
