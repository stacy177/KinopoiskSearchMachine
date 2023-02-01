//
//  NetworkManager.swift
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
            return .requestParameters(parameters: ["token": token,
                                                   "search": name],
                                      encoding: URLEncoding.queryString)
        case .bestMovies(page: let page):
            return .requestParameters(parameters: ["field": ["rating.kp", "year", "typeNumber"],
                                                   "search": ["7-10", "2017-2022", "2"],
                                                   "sortField": ["year", "votes.imdb"],
                                                   "sortType": ["1", "-1"],
                                                   "page": "\(page)",
                                                   "token": token],
                                      encoding: URLEncoding.queryString) // correction is needed
        case .newMovies(page: let page):
            return .requestParameters(parameters: ["field": ["rating.kp", "year", "typeNumber"],
                                                   "search": ["7-10", "2020-2022", "2"],
                                                   "sortField": ["year", "votes.imdb"],
                                                   "sortType": ["1", "1"],
                                                   "page": "\(page)",
                                                   "token": token],
                                      encoding: URLEncoding.queryString)
        case .detailMovie(id: let id):
            return .requestParameters(parameters: ["token": token,
                                                   "search": "\(id)"],
                                      encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return nil
    }
}
