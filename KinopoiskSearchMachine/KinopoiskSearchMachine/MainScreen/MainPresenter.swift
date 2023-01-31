//
//  MainPresenter.swift
//

protocol MainPresentationLogic {
    func presentInitForm(_ response: [Main.InitForm.Response])
}

final class MainPresenter: MainPresentationLogic {
    weak var view: MainDisplayLogic?

    func presentInitForm(_ response: [Main.InitForm.Response]) {
        let sectionMovies = response.map {
            Main.MovieData(sortType: .top, poster: nil, title: $0.title, year: $0.year, genre: $0.genre, id: $0.id)
        }
        view?.displayInitForm(Main.InitForm.ViewModel(movies: [.init(header: "", data: sectionMovies)]))
    }
}
