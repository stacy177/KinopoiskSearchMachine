//
//  ActorSearchPresenter.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

final class ActorSearchPresenter: ActorSearchPresentationLogic {
    weak var view: ActorSearchDisplayLogic?

    func presentInitForm(_ response: ActorSearch.InitForm.Response) {
        view?.displayInitForm(ActorSearch.InitForm.ViewModel())
    }
}
