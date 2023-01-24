//
//  GenreSearchRouter.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
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
