//
//  GenreSearchPresenter.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

final class GenreSearchPresenter: GenreSearchPresentationLogic {
    weak var view: GenreSearchDisplayLogic?

    func presentInitForm(_ response: GenreSearch.InitForm.Response) {
        view?.displayInitForm(GenreSearch.InitForm.ViewModel())
    }
}
