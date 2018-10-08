//
//  movieDetailPageLogic.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/10/6.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit

protocol movieDetailPageLogicDelegate {
    func reloadMoiveDetailPage()
}

class movieDetailPageLogic: NSObject {
    var movieId:Int!
    var movieDetailData:movieDetailModel?
    var delegate:movieDetailPageLogicDelegate?
    
    func getDetailData() {
        movieDataProvider.sharedProvider().getMovieDetailData(forMovieId: String(self.movieId), onSuccess: {[weak self](movieDetailResponse) in
            self?.movieDetailData = movieDetailResponse
            self?.delegate?.reloadMoiveDetailPage()
        }, onFailure: {(Error) in
            
        })
    }
}
