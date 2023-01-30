//
//  MainInteractor.swift
//

import Foundation
import Moya

protocol MainBusinessLogic {
    func requestInitForm(_ request: Main.InitForm.Request)
}

final class MainInteractor: MainBusinessLogic, MainDataStore {
    var page: Int = 1
    private let presenter: MainPresentationLogic

    init(presenter: MainPresentationLogic) {
        self.presenter = presenter
    }

    func requestInitForm(_ request: Main.InitForm.Request) {
        NetworkManager.getTopSeries(page: page) { result in
            switch result {
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Main.InitForm.Response())
        }
    }
}
