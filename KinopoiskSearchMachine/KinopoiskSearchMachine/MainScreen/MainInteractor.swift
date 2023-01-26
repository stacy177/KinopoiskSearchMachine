//
//  MainInteractor.swift
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
