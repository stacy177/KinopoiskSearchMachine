//
//  ActorSearchPresenter.swift
//

final class ActorSearchPresenter: ActorSearchPresentationLogic {
    weak var view: ActorSearchDisplayLogic?

    func presentInitForm(_ response: ActorSearch.InitForm.Response) {
        view?.displayInitForm(ActorSearch.InitForm.ViewModel())
    }
}
