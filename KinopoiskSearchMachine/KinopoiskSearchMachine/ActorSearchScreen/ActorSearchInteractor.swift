//
//  ActorSearchInteractor.swift
//

import Foundation

final class ActorSearchInteractor: ActorSearchBusinessLogic, ActorSearchDataStore {
    private let presenter: ActorSearchPresentationLogic
    private let worker: ActorSearchWorkerLogic

    init(
        presenter: ActorSearchPresentationLogic,
        worker: ActorSearchWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: ActorSearch.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(ActorSearch.InitForm.Response())
        }
    }
}
