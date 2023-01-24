//
//  ActorSearchAssembly.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
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
