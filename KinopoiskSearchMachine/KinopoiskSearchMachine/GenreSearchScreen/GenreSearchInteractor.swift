//
//  GenreSearchInteractor.swift
//

import Foundation

final class GenreSearchInteractor: GenreSearchBusinessLogic, GenreSearchDataStore {
    private let presenter: GenreSearchPresentationLogic
    private let worker: GenreSearchWorkerLogic

    init(
        presenter: GenreSearchPresentationLogic,
        worker: GenreSearchWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: GenreSearch.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(GenreSearch.InitForm.Response())
        }
    }
}
