//
//  MainModels.swift
//

import UIKit

enum Main {
    enum InitForm {
        struct Request {
            let title: String?
            let year: Int?
            let genre: String?
        }
        struct Response {
            let imageUrl: String?
            let title: String?
            let year: Int?
            let genre: String?
        }
        struct ViewModel {
            let movies: [MovieData]?
        }
    }

    struct MovieData {
        let poster: UIImage?
        let title: String?
        let year: Int?
        let genre: String?
    }
}
