//
//  MainPresenter.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

final class MainPresenter: MainPresentationLogic {
    weak var view: MainDisplayLogic?

    func presentInitForm(_ response: Main.InitForm.Response) {
        view?.displayInitForm(Main.InitForm.ViewModel())
    }
}
