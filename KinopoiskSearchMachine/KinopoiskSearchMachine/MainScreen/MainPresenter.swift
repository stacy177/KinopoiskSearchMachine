//
//  MainPresenter.swift
//

import UIKit

protocol MainPresentationLogic {
    func appendMovies(_ response: [Main.InitForm.Response], type: Main.SortType)
}

final class MainPresenter: MainPresentationLogic {
    
    weak var view: MainDisplayLogic?
    
    var viewModel: Main.InitForm.ViewModel = .init(sections: [.new: [], .top: []])
    func appendMovies(_ response: [Main.InitForm.Response], type: Main.SortType) {
        let sectionMovies = response.map {
            Main.MovieData(poster: $0.imageUrl, title: $0.title, year: $0.year, genre: $0.genre, id: $0.id)
        }
        viewModel.sections[type]?.append(contentsOf: sectionMovies)
        
        view?.displayUpdate(viewModel)
    }
    
    class DataLoadOperation: Operation {
        
        var response: Main.InitForm.Response?
        var compition: ((Main.InitForm.Response) -> Void)?
        
        private let _response: Main.InitForm.Response
        
        init(_ response: Main.InitForm.Response) {
            _response = response
        }
        
        override func main() {
            //
        }
        
    }
}
