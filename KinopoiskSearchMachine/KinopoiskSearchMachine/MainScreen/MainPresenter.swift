//
//  MainPresenter.swift
//

protocol MainPresentationLogic {
    func appendMovies(_ response: [Main.InitForm.Response], type: Main.SortType)
}

final class MainPresenter: MainPresentationLogic {

    weak var view: MainDisplayLogic?

    var viewModel: Main.InitForm.ViewModel = .init(sections: [])
    func appendMovies(_ response: [Main.InitForm.Response], type: Main.SortType) {
        let sectionMovies = response.map {
            Main.MovieData(poster: nil, title: $0.title, year: $0.year, genre: $0.genre, id: $0.id)
        }

        if viewModel.sections.count < 2 {
            switch type {
            case .new:
                viewModel.sections.append(Main.InitForm.SectionModel(header: .new, data: sectionMovies))
            case .top:
                viewModel.sections.append(Main.InitForm.SectionModel(header: .top, data: sectionMovies))
            }
        } else {
            viewModel.sections[1].data += sectionMovies
        }
        view?.displayUpdate(viewModel)
    }
}
