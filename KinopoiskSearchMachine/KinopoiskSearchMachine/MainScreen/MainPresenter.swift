//
//  MainPresenter.swift
//

import UIKit

protocol MainPresentationLogic {
    func presentInitMovies(_ response: [Main.SortType: [Main.InitForm.Response]])
    func appendMovies(_ response: [Main.InitForm.Response], indexPaths: [IndexPath])
}

final class MainPresenter: MainPresentationLogic {

    weak var view: MainDisplayLogic?

    func presentInitMovies(_ response: [Main.SortType : [Main.InitForm.Response]]) {
        var result: [Main.SortType: [Main.InitForm.ViewModel]] = [:]
        response.forEach { type, value in
            result[type] = convertToVm(response: value)
        }

        view?.displayInit(result)
    }

    func appendMovies(_ response: [Main.InitForm.Response], indexPaths: [IndexPath]) {
        let viewModel = convertToVm(response: response)
        view?.displayAppend(viewModel, indexPaths: indexPaths)
    }

    private func convertToVm(response: [Main.InitForm.Response]) -> [Main.InitForm.ViewModel] {
        let vm = response.map { Main.InitForm.ViewModel(poster: $0.imageUrl, title: $0.title, year: $0.year, genre: $0.genre, id: $0.id) }
        return vm
    }
    
//    var viewModel: Main.InitForm.ViewModel = .init(sections: [.new: [], .top: []])
//
//    func appendMovies(_ response: [Main.InitForm.Response], type: Main.SortType) {
//        let sectionMovies = response.map {
//            Main.MovieData(poster: $0.imageUrl, title: $0.title, year: $0.year, genre: $0.genre, id: $0.id)
//        }
//        viewModel.sections[type]?.append(contentsOf: sectionMovies)
//
//        view?.displayUpdate(viewModel)
//    }
//
//    func appendTopMovies(_ response: [Main.InitForm.Response]) {
//        let sectionMovies = response.map {
//            Main.MovieData(poster: $0.imageUrl, title: $0.title, year: $0.year, genre: $0.genre, id: $0.id)
//        }
//        viewModel.sections[.top]?.append(contentsOf: sectionMovies)
//
//        view?.displayAppend(viewModel)
//    }
}
