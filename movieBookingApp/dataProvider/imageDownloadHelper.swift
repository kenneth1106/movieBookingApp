//
//  imageDownloadHelper.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/10/6.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit

class imageDownloadHelper: NSObject {
    static let small_size_prefix = "w154"
    static let regular_size_prefix = "w185"
    static let imageEndpoint = "https://image.tmdb.org/t/p"
    
    private static var imageDownloadInstance: imageDownloadHelper?
    static func sharedProvider() -> imageDownloadHelper {
        if imageDownloadInstance == nil {
            imageDownloadInstance = imageDownloadHelper()
        }
        return imageDownloadInstance!
    }
    
    /// download data from url
    ///
    /// - Parameters:
    ///   - url: given url for image
    ///   - completion: return downloaded data
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    /// download image from url
    ///
    /// - Parameters:
    ///   - imageName: the image base name for the image url
    ///   - view: the view to display the image
    func downloadImage(from imageName: String, forView view: UIImageView) {
        if imageName.elementsEqual(imageDownloadHelper.regular_size_prefix) == true || imageName.elementsEqual(imageDownloadHelper.small_size_prefix) == true {
            return
        }
        
        getData(from: URL(string: String(format: "%@/%@", imageDownloadHelper.imageEndpoint, imageName))!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                view.image = UIImage(data: data)
                view.layoutIfNeeded()
            }
        }
    }

}
