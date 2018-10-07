//
//  movieDetailModel.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/10/1.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit
import ObjectMapper

class movieDetailModel: Mappable {
    var movieId: Int!
    var title: String?
    var popularity: Float?
    var posterPath: String?
    var backdropPath: String?
    var spokenLanguages: String?
    var genres: String?
    var overview: String?
    var runtime: Int?
    
    
    required init?(map: Map) {
        self.movieId = map.JSON["id"] as! Int
    }
    
    func mapping(map: Map) {
        title           <- map["title"]
        popularity      <- map["popularity"]
        posterPath      <- map["poster_path"]
        backdropPath    <- map["backdrop_path"]
        spokenLanguages <- map["spoken_languages.0.name"]
        genres          <- map["genres.0.name"]
        overview        <- map["overview"]
        runtime         <- map["runtime"]
    }
    
    func getRuntime() -> String {
        if (self.runtime != nil && self.runtime! > 0) {
            if (self.runtime!/60) > 0 {
                return String(format: String(self.runtime!/60) + "h" + String(self.runtime!%60) + "m")
            }
            return String(format: String(self.runtime!%60) + "m")
        }
        return ""
    }
}
