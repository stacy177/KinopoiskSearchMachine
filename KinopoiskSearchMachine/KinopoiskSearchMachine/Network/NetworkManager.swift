//
//  NetworkManager.swift
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

    static func getDetailMovie(id: Int, completion: @escaping (Result<Movies, Error>) -> Void) {
        provider.request(.detailMovie(id: id)) { result in
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

    static func getNewMovies(page: Int, completion: @escaping (Result<Movies, Error>) -> Void) {
        provider.request(.newMovies(page: page)) { result in
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

    static func getSearchMovie(name: String, completion: @escaping (Result<Movies, Error>) -> Void) {
        provider.request(.searchMovies(name: name)) { result in
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
