//
//  movieListLogic.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/9/26.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit

protocol movieListLogicDelegate {
    func reloadMoiveList()
}

class movieListLogic: NSObject {
    var currentMovieList: movieListModel?
    var delegate: movieListLogicDelegate?
    var isLoading: Bool = false
    
    /// get movie list data
    func getList() {
        if self.isLoading {
            return
        }
        
        self.isLoading = true
        weak var weakSelf = self
        movieDataProvider.sharedProvider().getMovieListData(forPage: (self.currentMovieList?.page ?? 0) + 1, onSuccess: {(movieListResult) in
//            print("!!!! load for page: ", weakSelf?.currentMovieList?.page as Any)
            weakSelf?.isLoading = false
            if weakSelf?.currentMovieList == nil {
                weakSelf?.currentMovieList = movieListResult
                weakSelf!.delegate?.reloadMoiveList()
                return
            }
            weakSelf!.currentMovieList!.page = movieListResult.page
            weakSelf!.currentMovieList!.results! += movieListResult.results!
            weakSelf!.delegate?.reloadMoiveList()
        }, onFailure: {(Error) in
            
        })
    }
    
    func getMovieDataForIndex(index: Int) -> movieModel {
        return (self.currentMovieList?.results![index])!
    }
    
    func getCurrentMovieListCount() -> Int {
        return currentMovieList?.results?.count ?? 0
    }
    
    func refreshLoadedData() {
        self.currentMovieList = nil
        self.delegate?.reloadMoiveList()
        self.getList()
    }
}
