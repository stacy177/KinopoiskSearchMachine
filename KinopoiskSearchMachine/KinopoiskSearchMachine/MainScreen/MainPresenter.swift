//
//  MainPresenter.swift
//

protocol MainPresentationLogic {
    func presentInitForm(_ response: [Main.InitForm.Response])
}

final class MainPresenter: MainPresentationLogic {
    weak var view: MainDisplayLogic?

    func presentInitForm(_ response: [Main.InitForm.Response]) {
        view?.displayInitForm(Main.InitForm.ViewModel(movies: ))
    }
}
