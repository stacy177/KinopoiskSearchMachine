//
//  MainPresenter.swift
//

final class MainPresenter: MainPresentationLogic {
    weak var view: MainDisplayLogic?

    func presentInitForm(_ response: Main.InitForm.Response) {
        view?.displayInitForm(Main.InitForm.ViewModel())
    }
}
