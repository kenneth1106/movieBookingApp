//
//  movieModel.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/9/26.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit
import ObjectMapper

class movieModel: Mappable {
    var movieId: Int!
    var title: String?
    var popularity: Float?
    var posterPath: String?
    var backdropPath: String?
    
    required init?(map: Map) {
        self.movieId = map.JSON["id"] as! Int
    }
    
    func mapping(map: Map) {
        title           <- map["title"]
        popularity      <- map["popularity"]
        posterPath     <- map["poster_path"]
        backdropPath   <- map["backdrop_path"]
    }
    
}
