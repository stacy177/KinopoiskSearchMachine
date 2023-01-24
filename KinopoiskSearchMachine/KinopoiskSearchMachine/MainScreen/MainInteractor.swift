//
//  MainInteractor.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class MainInteractor: MainBusinessLogic, MainDataStore {
    private let presenter: MainPresentationLogic
    private let worker: MainWorkerLogic

    init(
        presenter: MainPresentationLogic,
        worker: MainWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Main.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Main.InitForm.Response())
        }
    }
}
