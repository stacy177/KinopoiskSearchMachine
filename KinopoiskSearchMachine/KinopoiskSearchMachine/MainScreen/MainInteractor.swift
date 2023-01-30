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
    let provider = MoyaProvider<MovieType>()

    init(presenter: MainPresentationLogic) {
        self.presenter = presenter
    }

    func requestInitForm(_ request: Main.InitForm.Request) {
        provider.request(.bestMovies(page: 1)) { result in
            switch result {
            case .success(let response):
                print(response.response)
                do {
                    let json = try JSONDecoder().decode(Movies.self, from: response.data)
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Main.InitForm.Response())
        }
    }
}
