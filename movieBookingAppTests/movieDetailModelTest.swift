//
//  movieDetailModelTest.swift
//  movieBookingAppTests
//
//  Created by Chen Yu-wen on 2018/10/7.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import movieBookingApp

class movieDetailModelTest: XCTestCase {
    var movie:movieDetailModel!
    
    override func setUp() {
        super.setUp()
        
        let jsonData = try? JSONSerialization.data(withJSONObject: ["id":123,
                                                                    "title":"movie title",
                                                                    "popularity":0.6,
                                                                    "overview":"movie overview"],
                                                   options: .prettyPrinted)
        movie = Mapper<movieDetailModel>().map(JSONString: String(data: jsonData!, encoding: .ascii)!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        movie = nil
    }
    
    func testMovieTitle() {
        XCTAssertTrue(movie.title?.elementsEqual("movie title") == true)
    }
    
    func testDuration() {
        movie.runtime = 100
        XCTAssertTrue(movie.getRuntime().elementsEqual("1h40m") == true)
        
        movie.runtime = 30
        XCTAssertTrue(movie.getRuntime().elementsEqual("30m") == true)
        
        movie.runtime = 60
        XCTAssertTrue(movie.getRuntime().elementsEqual("1h0m") == true)
    }
}
