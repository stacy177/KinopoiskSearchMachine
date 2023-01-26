//
//  GenreSearchRouter.swift
//

import UIKit

final class GenreSearchRouter: GenreSearchRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: GenreSearchDataStore

    init(dataStore: GenreSearchDataStore) {
        self.dataStore = dataStore
    }
}

private extension GenreSearchRouter {
//    func passDataTo_() {
//        source: GenreSearchDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
