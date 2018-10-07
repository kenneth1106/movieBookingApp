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
        weak var weakSelf = self
        movieDataProvider.sharedProvider().getMovieDetailData(forMovieId: String(self.movieId), onSuccess: {(movieDetailResponse) in
            weakSelf?.movieDetailData = movieDetailResponse
            weakSelf?.delegate?.reloadMoiveDetailPage()
        }, onFailure: {(Error) in
            
        })
    }
}
