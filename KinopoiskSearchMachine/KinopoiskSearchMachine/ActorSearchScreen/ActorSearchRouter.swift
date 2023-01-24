//
//  ActorSearchRouter.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ActorSearchRouter: ActorSearchRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: ActorSearchDataStore

    init(dataStore: ActorSearchDataStore) {
        self.dataStore = dataStore
    }
}

private extension ActorSearchRouter {
//    func passDataTo_() {
//        source: ActorSearchDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
