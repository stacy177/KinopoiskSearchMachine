//
//  MainInteractor.swift
//

import Foundation
import Moya

protocol MainBusinessLogic {
    func setup(_ request: Main.InitForm.Request)
}

final class MainInteractor: MainBusinessLogic, MainDataStore {
    var page: Int = 0
    private let presenter: MainPresentationLogic

    private var movieResponseArray: [Main.InitForm.Response]?

    init(presenter: MainPresentationLogic) {
        self.presenter = presenter
    }

    func setup(_ request: Main.InitForm.Request) {
        switch request.type {
        case .new:
            NetworkManager.getNewMovies(page: 1) { result in
                switch result {
                case .success(let movies):
                    let movieResponseArray = movies.docs?.map {
                        Main.InitForm.Response(imageUrl: $0.poster?.url, title: $0.names?[0].name, year: $0.year, genre: $0.type?.rawValue, id: $0.id)
                    }
                    guard let movieResponseArray = movieResponseArray else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.presenter.presentInitForm(movieResponseArray)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case .top:
            NetworkManager.getTopSeries(page: 1) { result in
                switch result {
                case .success(let movies):
                    let movieResponseArray = movies.docs?.map {
                        Main.InitForm.Response(imageUrl: $0.poster?.url, title: $0.names?[0].name, year: $0.year, genre: $0.type?.rawValue, id: $0.id)
                    }
                    guard let movieResponseArray = movieResponseArray else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.presenter.presentInitForm(movieResponseArray)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
