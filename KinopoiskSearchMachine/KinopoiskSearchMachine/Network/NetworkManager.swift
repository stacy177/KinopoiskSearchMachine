//
//  NetworkManager.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 29.01.2023.
//

import Foundation
import Moya

struct NetworkManager {
    fileprivate let provider = MoyaProvider<MovieType>()
}
