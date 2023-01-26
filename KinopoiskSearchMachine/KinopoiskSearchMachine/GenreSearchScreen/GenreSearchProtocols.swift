//
//  GenreSearchProtocols.swift
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
