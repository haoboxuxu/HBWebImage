//
//  UIImageView+HBWebImage.swift
//  HBWebImage
//
//  Created by 徐浩博 on 2021/11/24.
//

import UIKit

extension UIImageView: HBWebImageProtocol {
    //completionHandler: ((UIImage?) -> Void)
    public func hbSetImage(with url: URL?, placeholderImage: UIImage) {
        MainQueue.async {
            self.image = placeholderImage
        }
        guard let url = url else {
            print("url error")
            return
        }
        if let cachedImage = HBWebImageCacheManger.fetchCachedImage(urlStr: url.absoluteString) {
            MainQueue.async {
                self.image = cachedImage
            }
            return
        }
        
        fetchData(url: url) { result in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                MainQueue.async {
                    self.image = image
                }
                StorageQueue.async {
                    HBWebImageCacheManger.saveImage(data: data, urlStr: url.absoluteString)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
