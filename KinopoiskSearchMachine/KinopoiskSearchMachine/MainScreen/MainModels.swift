//
//  MainModels.swift
//

import UIKit

enum Main {
    enum InitForm {
        struct Request {
        }
        struct Response {
            let imageUrl: String?
            let title: String?
            let year: Int?
            let genre: String?
            let id: Int?
        }
        struct ViewModel {
            var sections: [SortType: [MovieData]]
        }
        
        struct SectionModel {
            let header: SortType?
            var data: [MovieData]
        }
    }
    
    enum SortType: String, Hashable {
        case new = "Новые фильмы"
        case top = "Популярные"
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .new:
                hasher.combine(self.rawValue)
            case .top:
                hasher.combine(self.rawValue)
            }
        }
    }

    enum RequestType {
        case initial, update
    }

    struct MovieData {
        let poster: String?
        let title: String?
        let year: Int?
        let genre: String?
        let id: Int?
    }
}
