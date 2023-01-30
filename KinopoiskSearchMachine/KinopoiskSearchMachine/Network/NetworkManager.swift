//
//  NetworkManager.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 29.01.2023.
//

import Foundation
import Moya

struct NetworkManager {
    static let provider = MoyaProvider<MovieType>()

    static func getTopSeries(page: Int, completion: @escaping (Result<Movies, Error>) -> Void) {
        provider.request(.bestMovies(page: page)) { result in
            switch result {
            case .success(let response):
                do {
                    let movies = try JSONDecoder().decode(Movies.self, from: response.data)
                    completion(.success(movies))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
