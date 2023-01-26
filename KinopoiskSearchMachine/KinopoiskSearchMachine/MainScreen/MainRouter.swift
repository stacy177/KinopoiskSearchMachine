//
//  MainRouter.swift
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
