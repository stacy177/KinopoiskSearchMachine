//
//  MainModels.swift
//

import UIKit

enum Main {
    enum InitForm {
        struct Request {
            let type: RequestType
        }
        struct Response {
            let imageUrl: String?
            let title: String?
            let year: Int?
            let genre: String?
            let id: Int?
        }
        struct ViewModel {
            var sections: [SectionModel]
        }
        
        struct SectionModel {
            let header: SortType?
            var data: [MovieData]
        }
    }
    
    enum SortType: String {
        case new = "Новые фильмы"
        case top = "Популярные"
    }

    enum RequestType {
        case initial, update
    }

    struct MovieData {
        let poster: UIImage?
        let title: String?
        let year: Int?
        let genre: String?
        let id: Int?
    }
}
