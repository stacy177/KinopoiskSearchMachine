//
//  Movies.swift
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let docs: [Doc]?
    let total, limit, page, pages: Int?
}

// MARK: - Doc
struct Doc: Codable {
    let externalID: ExternalID?
    let poster: Poster?
    let rating, votes: Rating?
    let id: Int?
    let type: TypeEnum?
    let name, description: String?
    let year: Int?
    let alternativeName: String?

    enum CodingKeys: String, CodingKey {
        case externalID
        case poster, rating, votes, id, type, name, description, year, alternativeName
    }
}

// MARK: - ExternalID
struct ExternalID: Codable {
    let tmdb: Int?
    let imdb: String?
}

// MARK: - Poster
struct Poster: Codable {
    let url, previewURL: String?

    enum CodingKeys: String, CodingKey {
        case url
        case previewURL
    }
}

// MARK: - Rating
struct Rating: Codable {
    let kp, imdb, tmdb: Double?
}

enum TypeEnum: String, Codable {
    case tvSeries = "tv-series"
}
