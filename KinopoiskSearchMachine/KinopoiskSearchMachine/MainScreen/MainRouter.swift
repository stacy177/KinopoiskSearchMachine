//
//  MainRouter.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MainRouter: MainRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: MainDataStore

    init(dataStore: MainDataStore) {
        self.dataStore = dataStore
    }
}

private extension MainRouter {
//    func passDataTo_() {
//        source: MainDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
