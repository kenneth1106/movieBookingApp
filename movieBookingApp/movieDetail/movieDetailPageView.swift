//
//  movieDetailPageView.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/10/6.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit

protocol movieDetailPageViewDelegate {
    func displayBookPage()
}

class movieDetailPageView: UIView {
    var delegate:movieDetailPageViewDelegate?
    
    private let moviePosterImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 154, height: 231))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 154))
        constraints.append(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal,
                                              toItem: imageView, attribute: .width, multiplier: 1.5, constant: 0))
        NSLayoutConstraint.activate(constraints)
        
        return imageView
    }()
    
    private let movieTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.sizeToFit()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private let movieGenresLabel: UILabel = {
        let genresLabel = UILabel()
        genresLabel.font = UIFont.boldSystemFont(ofSize: 16)
        genresLabel.textColor = .white
        genresLabel.numberOfLines = 1
        genresLabel.lineBreakMode = .byWordWrapping
        genresLabel.minimumScaleFactor = 0.5
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return genresLabel
    }()
    
    private let movieLanguageLabel: UILabel = {
        let languageLabel = UILabel()
        languageLabel.font = UIFont.boldSystemFont(ofSize: 16)
        languageLabel.textColor = .white
        languageLabel.numberOfLines = 1
        languageLabel.lineBreakMode = .byWordWrapping
        languageLabel.minimumScaleFactor = 0.5
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return languageLabel
    }()
    
    private let movieDurationLabel: UILabel = {
        let durationLabel = UILabel()
        durationLabel.font = UIFont.boldSystemFont(ofSize: 16)
        durationLabel.textColor = .white
        durationLabel.numberOfLines = 1
        durationLabel.lineBreakMode = .byWordWrapping
        durationLabel.minimumScaleFactor = 0.5
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return durationLabel
    }()
    
    private let movieSynopsisLabel: UILabel = {
        let synopsisLabel = UILabel()
        synopsisLabel.font = UIFont.systemFont(ofSize: 20)
        synopsisLabel.textColor = .white
        synopsisLabel.numberOfLines = 0
        synopsisLabel.lineBreakMode = .byWordWrapping
        synopsisLabel.sizeToFit()
        synopsisLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return synopsisLabel
    }()
    
    private let movieBookButton: UIButton = {
       let bookBtn = UIButton()
        bookBtn.setTitle("BOOK NOW", for: .normal)
        bookBtn.setTitleColor(.white, for: .normal)
        bookBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bookBtn.backgroundColor = .clear
        bookBtn.layer.borderWidth = 1
        bookBtn.layer.borderColor = UIColor.white.cgColor
        bookBtn.layer.cornerRadius = 8
        bookBtn.clipsToBounds = true
        bookBtn.addTarget(self, action: #selector(bookBtnClick), for: .touchUpInside)
        bookBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return bookBtn
    }()
    
    private let headerView: UIView = {
        let hView = UIView()
        hView.translatesAutoresizingMaskIntoConstraints = false
        return hView
    }()
    
    private let baseView: UIView = {
        let bView = UIView()
        bView.translatesAutoresizingMaskIntoConstraints = false
        return bView
    }()
    
    func setupConstraints() {
        headerView.addSubview(moviePosterImageView)
        headerView.addSubview(movieTitleLabel)
        
        baseView.addSubview(headerView)
        baseView.addSubview(movieGenresLabel)
        baseView.addSubview(movieLanguageLabel)
        baseView.addSubview(movieDurationLabel)
        baseView.addSubview(movieSynopsisLabel)
        baseView.addSubview(movieBookButton)
        self.addSubview(baseView)
        
        var constraints = [NSLayoutConstraint]()
        // base view
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .centerX, relatedBy: .equal,
                                              toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .centerY, relatedBy: .equal,
                                              toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .width, relatedBy: .equal,
                                              toItem: self, attribute: .width, multiplier: 0, constant: UIScreen.main.bounds.size.width * 0.8))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .height, relatedBy: .equal,
                                              toItem: self, attribute: .height, multiplier: 0, constant:UIScreen.main.bounds.size.height * 0.8))
        
        // header view
        constraints.append(NSLayoutConstraint(item: headerView, attribute: .centerX, relatedBy: .equal,
                                              toItem: baseView, attribute: .centerX, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: headerView, attribute: .width, relatedBy: .equal,
                                              toItem: baseView, attribute: .width, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: headerView, attribute: .top, relatedBy: .equal,
                                              toItem: baseView, attribute: .top, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: headerView, attribute: .bottom, relatedBy: .equal,
                                              toItem: movieGenresLabel, attribute: .top, multiplier: 1.0, constant: -20))
        
        // poster view
        constraints.append(NSLayoutConstraint(item: moviePosterImageView, attribute: .leading, relatedBy: .equal,
                                              toItem: headerView, attribute: .leading, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: moviePosterImageView, attribute: .top, relatedBy: .equal,
                                              toItem: headerView, attribute: .top, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: moviePosterImageView, attribute: .trailing, relatedBy: .equal,
                                              toItem: movieTitleLabel, attribute: .leading, multiplier: 1.0, constant: -10))
        constraints.append(NSLayoutConstraint(item: moviePosterImageView, attribute: .bottom, relatedBy: .equal,
                                              toItem: headerView, attribute: .bottom, multiplier: 1.0, constant: 0))
        
        // title label
        constraints.append(NSLayoutConstraint(item: movieTitleLabel, attribute: .leading, relatedBy: .equal,
                                              toItem: moviePosterImageView, attribute: .trailing, multiplier: 1.0, constant: 10))
        constraints.append(NSLayoutConstraint(item: movieTitleLabel, attribute: .trailing, relatedBy: .equal,
                                              toItem: headerView, attribute: .trailing, multiplier: 1.0, constant: -20))
        constraints.append(NSLayoutConstraint(item: movieTitleLabel, attribute: .top, relatedBy: .equal,
                                              toItem: moviePosterImageView, attribute: .top, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: movieTitleLabel, attribute: .height, relatedBy: .lessThanOrEqual,
                                              toItem: moviePosterImageView, attribute: .height, multiplier: 1.0, constant: 0))
        
        // genres label
        constraints.append(NSLayoutConstraint(item: movieGenresLabel, attribute: .leading, relatedBy: .equal,
                                              toItem: baseView, attribute: .leading, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: movieGenresLabel, attribute: .trailing, relatedBy: .equal,
                                              toItem: baseView, attribute: .trailing, multiplier: 1.0, constant: -20))
        constraints.append(NSLayoutConstraint(item: movieGenresLabel, attribute: .top, relatedBy: .equal,
                                              toItem: headerView, attribute: .bottom, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: movieGenresLabel, attribute: .bottom, relatedBy: .equal,
                                              toItem: movieLanguageLabel, attribute: .top, multiplier: 1.0, constant: -5))
        constraints.append(NSLayoutConstraint(item: movieGenresLabel, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20))
        
        // language label
        constraints.append(NSLayoutConstraint(item: movieLanguageLabel, attribute: .leading, relatedBy: .equal,
                                              toItem: baseView, attribute: .leading, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: movieLanguageLabel, attribute: .trailing, relatedBy: .equal,
                                              toItem: baseView, attribute: .trailing, multiplier: 1.0, constant: -20))
        constraints.append(NSLayoutConstraint(item: movieLanguageLabel, attribute: .top, relatedBy: .equal,
                                              toItem: movieGenresLabel, attribute: .bottom, multiplier: 1.0, constant: 5))
        constraints.append(NSLayoutConstraint(item: movieLanguageLabel, attribute: .bottom, relatedBy: .equal,
                                              toItem: movieDurationLabel, attribute: .top, multiplier: 1.0, constant: -5))
        constraints.append(NSLayoutConstraint(item: movieLanguageLabel, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20))
        
        // duration label
        constraints.append(NSLayoutConstraint(item: movieDurationLabel, attribute: .leading, relatedBy: .equal,
                                              toItem: baseView, attribute: .leading, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: movieDurationLabel, attribute: .trailing, relatedBy: .equal,
                                              toItem: baseView, attribute: .trailing, multiplier: 1.0, constant: -20))
        constraints.append(NSLayoutConstraint(item: movieDurationLabel, attribute: .top, relatedBy: .equal,
                                              toItem: movieLanguageLabel, attribute: .bottom, multiplier: 1.0, constant: 5))
        constraints.append(NSLayoutConstraint(item: movieDurationLabel, attribute: .bottom, relatedBy: .equal,
                                              toItem: movieSynopsisLabel, attribute: .top, multiplier: 1.0, constant: -20))
        constraints.append(NSLayoutConstraint(item: movieDurationLabel, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20))
        
        // synopsis label
        constraints.append(NSLayoutConstraint(item: movieSynopsisLabel, attribute: .leading, relatedBy: .equal,
                                              toItem: baseView, attribute: .leading, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: movieSynopsisLabel, attribute: .trailing, relatedBy: .equal,
                                              toItem: baseView, attribute: .trailing, multiplier: 1.0, constant: -20))
        constraints.append(NSLayoutConstraint(item: movieSynopsisLabel, attribute: .top, relatedBy: .equal,
                                              toItem: movieDurationLabel, attribute: .bottom, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: movieSynopsisLabel, attribute: .height, relatedBy: .greaterThanOrEqual,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 10))
        constraints.append(NSLayoutConstraint(item: movieBookButton, attribute: .top, relatedBy: .greaterThanOrEqual,
                                              toItem: movieSynopsisLabel, attribute: .bottom, multiplier: 1.0, constant: 20))
        
        // book btn
        constraints.append(NSLayoutConstraint(item: movieBookButton, attribute: .leading, relatedBy: .equal,
                                              toItem: baseView, attribute: .leading, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: movieBookButton, attribute: .trailing, relatedBy: .equal,
                                              toItem: baseView, attribute: .trailing, multiplier: 1.0, constant: -20))
        constraints.append(NSLayoutConstraint(item: movieBookButton, attribute: .top, relatedBy: .greaterThanOrEqual,
                                              toItem: movieSynopsisLabel, attribute: .bottom, multiplier: 1.0, constant: 5))
        constraints.append(NSLayoutConstraint(item: movieBookButton, attribute: .bottom, relatedBy: .equal,
                                              toItem: baseView, attribute: .bottom, multiplier: 1.0, constant: -20))
        constraints.append(NSLayoutConstraint(item: movieBookButton, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 44))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func updateContentWithData(movieDetailData:movieDetailModel) {
        imageDownloadHelper.sharedProvider().downloadImage(from: String(format: "%@%@", imageDownloadHelper.regular_size_prefix, movieDetailData.posterPath ?? ""), forView: self.moviePosterImageView)
        self.movieTitleLabel.text = movieDetailData.title
        self.movieGenresLabel.text = String(format:"Genres: " + (movieDetailData.genres ?? ""))
        self.movieLanguageLabel.text = String(format:"Language: " + (movieDetailData.spokenLanguages ?? ""))
        self.movieDurationLabel.text = String(format:"Duration: " + (movieDetailData.getRuntime()))
        self.movieSynopsisLabel.text = movieDetailData.overview
        self.layoutIfNeeded()
    }
    
    @objc func bookBtnClick() {
        self.delegate?.displayBookPage()
    }
}
