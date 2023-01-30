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
    let externalId: ExternalID?
    let logo: Logo?
    let poster: Poster?
    let rating, votes: Rating?
    let watchability: Watchability?
    let id: Int?
    let type: TypeEnum?
    let name, description: String?
    let year: Int?
    let alternativeName: String?
    let movieLength: Int?
    let names: [Name]?
    let shortDescription: String?
}

// MARK: - ExternalID
struct ExternalID: Codable {
    let kpHD: String?
    let imdb, id: String?
    let tmdb: Int?

    enum CodingKeys: String, CodingKey {
        case kpHD, imdb
        case id = "_id"
        case tmdb
    }
}

// MARK: - Logo
struct Logo: Codable {
    let id: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case url
    }
}

// MARK: - Name
struct Name: Codable {
    let id, name: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}

// MARK: - Poster
struct Poster: Codable {
    let id: String?
    let url, previewURL: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case url
        case previewURL = "previewUrl"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let id: String?
    let kp: Double?
    let imdb, filmCritics, russianFilmCritics: Int?
    let ratingAwait: Double?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case kp, imdb, filmCritics, russianFilmCritics
        case ratingAwait = "await"
    }
}

enum TypeEnum: String, Codable {
    case cartoon = "cartoon"
    case movie = "movie"
}

// MARK: - Watchability
struct Watchability: Codable {
    let id: String?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let logo: Logo?
    let name: String?
    let url: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case logo, name, url
        case id = "_id"
    }
}

