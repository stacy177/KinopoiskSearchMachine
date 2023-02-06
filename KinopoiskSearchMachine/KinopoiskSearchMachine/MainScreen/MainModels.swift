//
//  MainModels.swift
//

import UIKit

enum Main {
    enum InitForm {
        struct Request {
            let indexPath: IndexPath?
        }
        struct Response {
            let imageUrl: String?
            let title: String?
            let year: Int?
            let genre: String?
            let id: Int?
        }
        struct ViewModel {
            let poster: String?
            let title: String?
            let year: Int?
            let genre: String?
            let id: Int?
        }
    }
    
    enum SortType: Int {
        case new, top
    }
}
