//
//  ImageView.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//

import UIKit
extension UIImageView {
    
    func load(urlStr: String?, placeholder: UIImage? = "placeholder".bundleImage) {
        let cache = URLCache.shared
        guard let urlString = urlStr,
                !urlString.isEmpty
                ,let url = URL(string: urlString) else {
                   
                    self.image = placeholder
                    return
        }
        let request = URLRequest(url: url)
        ///check in cache first
        if let data = cache.cachedResponse(for: request)?.data,
           let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.image = image
            }
        } else {
            self.image = placeholder
            URLSession.shared.dataTask(with: request,
                                       completionHandler: { (data, response, error) in
                if let data = data, let response = response,
                   ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300,
                   let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }).resume()
        }
    }
}
