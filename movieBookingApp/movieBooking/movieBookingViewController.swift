//
//  movieBookingViewController.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/10/7.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit

class movieBookingViewController: UIViewController {
    static let bookingURL = "https://www.cathaycineplexes.com.sg/"
    var bookingWebView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.view.addSubview(self.bookingWebView)
        self.bookingWebView.backgroundColor = .white
        self.bookingWebView.frame = UIScreen.main.bounds
    }
    
    func setupNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.darkGray
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.title = "BOOKING"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bookingWebView.loadRequest(URLRequest(url: URL(string: movieBookingViewController.bookingURL)!))
    }

}
