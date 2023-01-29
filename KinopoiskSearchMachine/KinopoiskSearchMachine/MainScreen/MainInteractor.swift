//
//  MainInteractor.swift
//

import Foundation
import Moya

protocol MainBusinessLogic {
    func requestInitForm(_ request: Main.InitForm.Request)
}

final class MainInteractor: MainBusinessLogic, MainDataStore {
    private let presenter: MainPresentationLogic

    init(presenter: MainPresentationLogic) {
        self.presenter = presenter
    }

    func requestInitForm(_ request: Main.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Main.InitForm.Response())
        }
    }
}
