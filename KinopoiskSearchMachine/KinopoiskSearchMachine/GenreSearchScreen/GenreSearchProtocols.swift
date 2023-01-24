//
//  GenreSearchProtocols.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol GenreSearchDataStore {}

protocol GenreSearchBusinessLogic {
    func requestInitForm(_ request: GenreSearch.InitForm.Request)
}

protocol GenreSearchWorkerLogic {}

protocol GenreSearchPresentationLogic {
    func presentInitForm(_ response: GenreSearch.InitForm.Response)
}

protocol GenreSearchDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: GenreSearch.InitForm.ViewModel)
}

protocol GenreSearchRoutingLogic {}
