//
//  movieDetailPageViewController.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/9/26.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit

class movieDetailPageViewController: UIViewController, movieDetailPageLogicDelegate, movieDetailPageViewDelegate {
    var logic: movieDetailPageLogic!
    var movieDetailDataView = movieDetailPageView()
    
    class func initWithMovieId(movieId:Int) -> movieDetailPageViewController {
        let vc = movieDetailPageViewController()
        vc.logic = movieDetailPageLogic ()
        vc.logic.movieId = movieId
        vc.logic.delegate = vc
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        self.setupView()
        self.logic.getDetailData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func setupView() {
        self.movieDetailDataView.setupConstraints()
        self.movieDetailDataView.delegate = self
        self.movieDetailDataView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.movieDetailDataView)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: self.movieDetailDataView, attribute: .centerX, relatedBy: .equal,
                                              toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: self.movieDetailDataView, attribute: .centerY, relatedBy: .equal,
                                              toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: self.movieDetailDataView, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: self.movieDetailDataView, attribute: .height, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0))
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: movieDetailPageLogicDelegate
    func reloadMoiveDetailPage() {
        self.movieDetailDataView.updateContentWithData(movieDetailData: self.logic.movieDetailData!)
    }
    
    // MARK: movieDetailPageViewDelegate
    func displayBookPage() {
        let bookingPage = movieBookingViewController()
        self.navigationController?.pushViewController(bookingPage, animated: true)
    }
    
}
