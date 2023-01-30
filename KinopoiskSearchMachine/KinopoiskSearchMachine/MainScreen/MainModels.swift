//
//  MainModels.swift
//

import UIKit

enum Main {
    enum InitForm {
        struct Request {
            let data: [MovieData]?
        }
        struct Response {
            let imageUrl: String?
            let title: String?
            let year: Int?
            let genre: String?
            let id: Int?
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
        let id: Int?
    }
}
