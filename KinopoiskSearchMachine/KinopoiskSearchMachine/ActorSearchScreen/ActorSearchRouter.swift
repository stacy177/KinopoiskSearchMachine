//
//  ActorSearchRouter.swift
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
