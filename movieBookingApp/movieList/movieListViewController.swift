//
//  movieListViewController.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/9/23.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit

class movieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, movieListLogicDelegate {
    static let moviesCellIdentifier = "moviesCellIdentifier"
    
    let logic = movieListLogic()
    var movieListTableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(movieListViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = .white
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logic.getList()
        logic.delegate = self as movieListLogicDelegate
        
        self.title = "Hot moive list".capitalized
        
        let fullScreenSize = UIScreen.main.bounds.size
        
        movieListTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height), style: .plain)
        movieListTableView.backgroundColor = .darkGray
        movieListTableView.register(homeMoviesTableViewCell.self, forCellReuseIdentifier: movieListViewController.moviesCellIdentifier)
        
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
        
        movieListTableView.separatorStyle = .none
        movieListTableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0)
        movieListTableView.allowsSelection = true
        movieListTableView.allowsMultipleSelection = false
        movieListTableView.addSubview(self.refreshControl)
        
        self.view.addSubview(movieListTableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeMoviesTableViewCell.cell_height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.logic.getCurrentMovieListCount()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! homeMoviesTableViewCell).updateMovieDate(movie: self.logic.getMovieDataForIndex(index: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieListViewController.moviesCellIdentifier, for: indexPath as IndexPath) as UITableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie:movieModel = self.logic.getMovieDataForIndex(index: indexPath.row)
        let movieDetailVC = movieDetailPageViewController.initWithMovieId(movieId: selectedMovie.movieId)
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= self.movieListTableView.contentSize.height * 0.7{
//            print("!!!! try load more...")
            self.logic.getList()
        }
    }
    
    func reloadMoiveList() {
        self.movieListTableView.reloadData()
    }

    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.logic.refreshLoadedData()
        refreshControl.endRefreshing()
    }
}

