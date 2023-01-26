//
//  ActorSearchProtocols.swift
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
