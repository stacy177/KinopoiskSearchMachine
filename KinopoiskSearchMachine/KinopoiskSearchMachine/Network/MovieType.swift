//
//  NetworkManager.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 29.01.2023.
//

import Foundation
import Moya

enum MovieType {
    case bestMovies(page: Int)
    case newMovies(page: Int)
    case searchMovies(name: String)
    case detailMovie(id: Int)
}

extension MovieType: TargetType {

    var token: String {
        "T5H8AEE-SS4M01M-J9VSWP7-ZN88HGK"
    }

    var baseURL: URL {
        guard let url = URL(string: "https://api.kinopoisk.dev/")
        else { fatalError("url is unreachable") }
        return url
    }

    var path: String {
        "movie"
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        switch self {
        case .searchMovies(name: let name):
            return .requestParameters(parameters: ["token": token, "search": name], encoding: URLEncoding.queryString)
        case .bestMovies(page: let page):
            return .requestParameters(parameters: ["token": token, "page": "\(page)"], encoding: URLEncoding.queryString)
        case .newMovies(page: let page):
            return .requestParameters(parameters: ["token": token, "page": "\(page)"], encoding: URLEncoding.queryString)
        case .detailMovie(id: let id):
            return .requestParameters(parameters: ["token": token, "search": "\(id)"], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        switch self {
        case .bestMovies(_):
            return [
                "field": "typeNumber",
                "search": "1",
                "sortField": "votes.kp",
                "sortType": "-1",
                "limit": "20",
            ]
        case .detailMovie(_):
            return ["field": "id"]
        case .newMovies(_):
            return [
                "token" : token,
                "field": "typeNumber",
                "search": "1",
                "sortField": "votes.kp",
                "sortType": "-1",
                "limit": "20"
            ]
        case .searchMovies(_):
            return [
                "token" : token,
                "field": "name",
                "isStrict": "false"
            ]
        }
    }

    
}
