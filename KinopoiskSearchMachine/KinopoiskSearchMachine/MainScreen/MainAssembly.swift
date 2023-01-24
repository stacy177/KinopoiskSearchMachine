//
//  MainAssembly.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
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
