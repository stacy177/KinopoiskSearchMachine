//
//  MainProtocols.swift
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
