//
//  ActorSearchProtocols.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ActorSearchDataStore {}

protocol ActorSearchBusinessLogic {
    func requestInitForm(_ request: ActorSearch.InitForm.Request)
}

protocol ActorSearchWorkerLogic {}

protocol ActorSearchPresentationLogic {
    func presentInitForm(_ response: ActorSearch.InitForm.Response)
}

protocol ActorSearchDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: ActorSearch.InitForm.ViewModel)
}

protocol ActorSearchRoutingLogic {}
