//
//  movieDataProvider.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/9/26.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit
import AFNetworking
import ObjectMapper

class movieDataProvider: NSObject {
    let manager = AFHTTPSessionManager()
    let apiBaseUrl = "https://api.themoviedb.org/"
    let apiKey = "328c283cd27bd1877d9080ccb1604c91"
    let apiVersion = "3"
    
    let movieListEndPoint = "/discover/movie"
    let movieDetailEndPoint = "/movie/"
    
    private static var mInstance: movieDataProvider?
    static func sharedProvider() -> movieDataProvider {
        if mInstance == nil {
            mInstance = movieDataProvider()
        }
        return mInstance!
    }
    
    private override init(){
    }
    
    /// get movie list data from server
    ///
    /// - Parameters:
    ///   - forPage: for page
    ///   - success: success block with movieListModel
    ///   - failure: fail block with error
    func getMovieListData(forPage: Int, onSuccess success: @escaping (_ JSON: movieListModel) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void) {
        let parames = [
            "api_key" : apiKey,
            "primary_release_date.lte":"2016-12-31",
            "sort_by":"release_date.desc",
            "page": String(format: "%d", forPage),
        ]
        
        let ednPoint: String = apiBaseUrl + apiVersion + movieListEndPoint
        manager.get(ednPoint, parameters: parames, progress: nil, success: {
            (operation, responseObject) in
            let list = Mapper<movieListModel>().map(JSONObject: responseObject)
//            print("result: ", list?.total_pages as Any, list?.total_results as Any, list?.results as Any)
            success(list!)
        }, failure: {
            (operation, error) in
//            print("Error: " + error.localizedDescription)
            failure(error)
        })
    }
    
    /// get movie detail data for id from server
    ///
    /// - Parameters:
    ///   - forMovieId: the id of movie
    ///   - success: success block for movieDetailModel
    ///   - failure: fail block for error
    func getMovieDetailData(forMovieId: String, onSuccess success: @escaping (_ JSON: movieDetailModel) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void) {
        let parames = [
            "api_key" : apiKey,
            ]
        
        let ednPoint: String = apiBaseUrl + apiVersion + movieDetailEndPoint + forMovieId
        manager.get(ednPoint, parameters: parames, progress: nil, success: {
            (operation, responseObject) in
            let detail = Mapper<movieDetailModel>().map(JSONObject: responseObject)
//            print("detail:%@ ", detail! as Any)
            success(detail!)
        }, failure: {
            (operation, error) in
//            print("Error: " + error.localizedDescription)
            failure(error)
        })
    }

}
