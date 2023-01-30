//
//  MainInteractor.swift
//

import Foundation
import Moya

protocol MainBusinessLogic {
    func requestInitForm(_ request: Main.InitForm.Request)
}

final class MainInteractor: MainBusinessLogic, MainDataStore {
    var page: Int = 0
    private let presenter: MainPresentationLogic

    private var movieResponseArray: [Main.InitForm.Response]?

    init(presenter: MainPresentationLogic) {
        self.presenter = presenter
    }

    func requestInitForm(_ request: Main.InitForm.Request) {
        page += 1
        NetworkManager.getTopSeries(page: page) { result in
            switch result {
            case .success(let movies):
                _ = movies.docs?.map {
                    self.movieResponseArray?.append(.init(imageUrl: $0.poster?.url, title: $0.name, year: $0.year, genre: $0.type?.rawValue))
                }
                guard let array = self.movieResponseArray else {
                    return
                }
                DispatchQueue.main.async {
                    self.presenter.presentInitForm(array)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
