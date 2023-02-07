//
//  ImageLoader.swift
//

import UIKit

final class ImageDownloader {
    private let operationQueue = OperationQueue()
    
    func download(imageUrl: String?, completion: @escaping ((UIImage?) -> Void)) {
        let operation = DataLoadOperation.init(imageUrl: imageUrl)
        operation.completion = completion
        operationQueue.addOperation(operation)
    }    
}

fileprivate final class DataLoadOperation: Operation {
    var imageUrl: String?
    var completion: ((UIImage?) -> Void)?
    
    init(imageUrl: String?) {
        self.imageUrl = imageUrl
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        guard let url = URL(string: imageUrl ?? "") else { return }
        
        if isCancelled {
            return
        }
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                guard let completion = completion else { return }
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
}
