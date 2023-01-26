//
//  GenreSearchPresenter.swift
//

final class GenreSearchPresenter: GenreSearchPresentationLogic {
    weak var view: GenreSearchDisplayLogic?

    func presentInitForm(_ response: GenreSearch.InitForm.Response) {
        view?.displayInitForm(GenreSearch.InitForm.ViewModel())
    }
}
