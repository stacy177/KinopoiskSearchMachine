//
//  MainProtocols.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol MainDataStore {}

protocol MainBusinessLogic {
    func requestInitForm(_ request: Main.InitForm.Request)
}

protocol MainWorkerLogic {}

protocol MainPresentationLogic {
    func presentInitForm(_ response: Main.InitForm.Response)
}

protocol MainDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Main.InitForm.ViewModel)
}

protocol MainRoutingLogic {}
