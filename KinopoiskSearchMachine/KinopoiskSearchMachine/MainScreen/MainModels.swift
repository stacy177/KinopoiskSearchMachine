//
//  MainModels.swift
//

import UIKit

enum Main {
    enum InitForm {
        struct Request {
            let type: SortType
        }
        struct Response {
            let imageUrl: String?
            let title: String?
            let year: Int?
            let genre: String?
            let id: Int?
        }
        struct ViewModel {
            let movies: [SectionModel]?
        }
        
        struct SectionModel {
            let header: String?
            let data: [MovieData]
        }
    }
    
    enum SortType: String {
        case new = "Новые фильмы"
        case top = "Популярные"
    }

    struct MovieData {
        let sortType: SortType
        let poster: UIImage?
        let title: String?
        let year: Int?
        let genre: String?
        let id: Int?
    }
}
