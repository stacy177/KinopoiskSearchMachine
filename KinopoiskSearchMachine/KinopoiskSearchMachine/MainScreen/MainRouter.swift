//
//  MainRouter.swift
//

import UIKit

protocol MainRoutingLogic {}
protocol MainDataStore {}

final class MainRouter: MainRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: MainDataStore

    init(dataStore: MainDataStore) {
        self.dataStore = dataStore
    }
}

private extension MainRouter { }
