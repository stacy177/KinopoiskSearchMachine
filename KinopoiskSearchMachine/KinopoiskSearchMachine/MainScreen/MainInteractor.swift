//
//  MainInteractor.swift
//

import Foundation
import Moya

protocol MainBusinessLogic {
    func setup(_ request: Main.InitForm.Request)
}

final class MainInteractor: MainBusinessLogic, MainDataStore {
    var page: Int = 1
    private let presenter: MainPresentationLogic

    private var movieResponseArray: [Main.InitForm.Response]?

    init(presenter: MainPresentationLogic) {
        self.presenter = presenter
    }

    func setup(_ request: Main.InitForm.Request) {
        switch request.type {
        case .initial:
            newMoviesRequest(page: page)
            topMoviesRequest(page: page)
        case .update:
            page += 1
            topMoviesRequest(page: page)
        }
    }

    private func newMoviesRequest(page: Int) {
        NetworkManager.getNewMovies(page: page) { result in
            switch result {
            case .success(let movies):
                let newMovies = movies.docs?.map {
                    Main.InitForm.Response(imageUrl: $0.poster?.url, title: $0.name, year: $0.year, genre: $0.type?.rawValue, id: $0.id)
                }
                self.presenter.appendMovies(newMovies ?? [], type: .new)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func topMoviesRequest(page: Int) {
        NetworkManager.getTopSeries(page: page) { result in
            switch result {
            case .success(let movies):
                let topMovies = movies.docs?.map {
                    Main.InitForm.Response(imageUrl: $0.poster?.url, title: $0.name, year: $0.year, genre: $0.type?.rawValue, id: $0.id)
                }
                self.presenter.appendMovies(topMovies ?? [], type: .top)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
