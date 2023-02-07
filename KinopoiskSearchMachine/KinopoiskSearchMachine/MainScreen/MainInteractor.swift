//
//  MainInteractor.swift
//

import UIKit
import Moya

protocol MainBusinessLogic {
    func setup()
    func update(indexPaths: [IndexPath])
}

final class MainInteractor: MainBusinessLogic, MainDataStore {
    var page: Int = 1
    private let presenter: MainPresentationLogic

    private var movieResponseDict: [Main.SortType: [Main.InitForm.Response]] = [:]

    init(presenter: MainPresentationLogic) {
        self.presenter = presenter
    }

    func setup() {

        let group = DispatchGroup()
        group.enter()
        NetworkManager.getNewMovies(page: page) { result in
            switch result {
            case .success(let movies):
                let response = self.convertToResponse(movies: movies)
                self.movieResponseDict[.new] = response
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        group.enter()
        NetworkManager.getTopSeries(page: page) {
            result in
            switch result {
            case .success(let movies):
                let response = self.convertToResponse(movies: movies)
                self.movieResponseDict[.top] = response
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        group.notify(queue: .main) {
            self.presenter.presentInitMovies(self.movieResponseDict)
        }
    }

    func update(indexPaths: [IndexPath]) {
        page += 1
        NetworkManager.getTopSeries(page: page) { result in
            switch result {
            case .success(let movies):
                let response = self.convertToResponse(movies: movies)
                DispatchQueue.main.async {
                    self.presenter.appendMovies(response, indexPaths: indexPaths)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func convertToResponse(movies: Movies) -> [Main.InitForm.Response] {
        let response = movies.docs?.map {
            Main.InitForm.Response(imageUrl: $0.poster?.url, title: $0.name, year: $0.year, genre: $0.type?.rawValue, id: $0.id)
        }
        guard let response = response else { return [] }
        return response
    }
}

