//
//  ImageLoader.swift
//

import UIKit

final class ImageDownloader {
    
    func download(imageUrl: String?, completion : @escaping (UIImage?)-> Void) {
       guard let url = URL(string: imageUrl ?? "") else { return }
        DispatchQueue.global(qos: .default).async {
            completion(self.loadImage(url: url))
        }
    }
    
    private func loadImage(url: URL) -> UIImage? {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                   return image
                }
        }
        return nil
   }
}
