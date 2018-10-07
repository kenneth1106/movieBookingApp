//
//  movieListModel.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/9/26.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit
import ObjectMapper

class movieListModel: Mappable {
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [movieModel]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        page            <- map["page"]
        total_results   <- map["total_results"]
        total_pages     <- map["total_pages"]
        results         <- map["results"]
    }
}
