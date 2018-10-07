//
//  homeMoviesTableViewCell.swift
//  movieBookingApp
//
//  Created by Chen Yu-wen on 2018/9/23.
//  Copyright © 2018年 Chen Yu-wen. All rights reserved.
//

import UIKit

class homeMoviesTableViewCell: UITableViewCell {
    
    static var cell_height: CGFloat {
        return UIScreen.main.bounds.size.width * 0.6
    }
    
    private let movieMainImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: cell_height))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let maskView = UIView(frame: imageView.frame)
        maskView.backgroundColor = .black
        maskView.alpha = 0.8
        maskView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(maskView)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: maskView, attribute: .centerX, relatedBy: .equal,
                                              toItem: imageView, attribute: .centerX, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: maskView, attribute: .centerY, relatedBy: .equal,
                                              toItem: imageView, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: maskView, attribute: .width, relatedBy: .equal,
                                              toItem: imageView, attribute: .width, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: maskView, attribute: .height, relatedBy: .equal,
                                              toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0))
        NSLayoutConstraint.activate(constraints)
        
        return imageView
    }()
    
    private let moviePosterImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 154, height: 231))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let movieTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .right
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 3
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private let popularityView: UIView = {
        let popuView = UIView()
        popuView.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView(image: #imageLiteral(resourceName: "popularityIcon"))
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        var dataLabel = UILabel()
        dataLabel.font = UIFont.systemFont(ofSize: 14)
        dataLabel.textAlignment = .right
        dataLabel.textColor = .white
        dataLabel.numberOfLines = 1
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        popuView.addSubview(iconImageView)
        popuView.addSubview(dataLabel)

        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal,
                                              toItem: popuView, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: iconImageView, attribute: .width, relatedBy: .equal,
                                              toItem: iconImageView, attribute: .height, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: iconImageView, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 16))
        constraints.append(NSLayoutConstraint(item: iconImageView, attribute: .bottom, relatedBy: .equal,
                                              toItem: popuView, attribute: .bottom, multiplier: 1.0, constant: 0))

        constraints.append(NSLayoutConstraint(item: dataLabel, attribute: .centerY, relatedBy: .equal,
                                              toItem: iconImageView, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: dataLabel, attribute: .height, relatedBy: .equal,
                                              toItem: iconImageView, attribute: .height, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: dataLabel, attribute: .leading, relatedBy: .equal,
                                              toItem: iconImageView, attribute: .trailing, multiplier: 1.0, constant: 5))
        constraints.append(NSLayoutConstraint(item: dataLabel, attribute: .trailing, relatedBy: .equal,
                                              toItem: popuView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
        
        func updatePopulationData(data: String) {
            dataLabel.text = ""
        }
        
        return popuView
    }()
    
    private let baseView: UIView = {
        let bView = UIView()
        bView.translatesAutoresizingMaskIntoConstraints = false
        return bView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(baseView)
        baseView.addSubview(movieMainImageView)
        baseView.addSubview(moviePosterImageView)
        baseView.addSubview(movieTitleLabel)
        baseView.addSubview(popularityView)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .centerX, relatedBy: .equal,
                                              toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .centerY, relatedBy: .equal,
                                              toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .width, relatedBy: .equal,
                                              toItem: self, attribute: .width, multiplier: 0, constant: UIScreen.main.bounds.size.width))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .height, relatedBy: .equal,
                                              toItem: self, attribute: .height, multiplier: 0, constant: CGFloat(homeMoviesTableViewCell.cell_height)))
        
        constraints.append(NSLayoutConstraint(item: movieMainImageView, attribute: .centerX, relatedBy: .equal,
                                              toItem: baseView, attribute: .centerX, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: movieMainImageView, attribute: .centerY, relatedBy: .equal,
                                              toItem: baseView, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: movieMainImageView, attribute: .width, relatedBy: .equal,
                                              toItem: baseView, attribute: .width, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: movieMainImageView, attribute: .height, relatedBy: .equal,
                                              toItem: baseView, attribute: .height, multiplier: 1.0, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: moviePosterImageView, attribute: .centerY, relatedBy: .equal,
                                              toItem: baseView, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: moviePosterImageView, attribute: .leading, relatedBy: .equal,
                                              toItem: baseView, attribute: .leading, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: moviePosterImageView, attribute: .top, relatedBy: .equal,
                                              toItem: baseView, attribute: .top, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .bottom, relatedBy: .equal,
                                              toItem: moviePosterImageView, attribute: .bottom, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: moviePosterImageView, attribute: .width, relatedBy: .equal,
                                              toItem: moviePosterImageView, attribute: .height, multiplier: 0.67, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: movieTitleLabel, attribute: .leading, relatedBy: .equal,
                                              toItem: moviePosterImageView, attribute: .trailing, multiplier: 1.0, constant: 5))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .trailing, relatedBy: .equal,
                                              toItem: movieTitleLabel, attribute: .trailing, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: movieTitleLabel, attribute: .top, relatedBy: .greaterThanOrEqual,
                                              toItem: baseView, attribute: .top, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: popularityView, attribute: .top, relatedBy: .equal,
                                              toItem: movieTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 10))
        
        constraints.append(NSLayoutConstraint(item: popularityView, attribute: .leading, relatedBy: .equal,
                                              toItem: moviePosterImageView, attribute: .trailing, multiplier: 1.0, constant: 5))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .trailing, relatedBy: .equal,
                                              toItem: popularityView, attribute: .trailing, multiplier: 1.0, constant: 20))
        constraints.append(NSLayoutConstraint(item: popularityView, attribute: .top, relatedBy: .equal,
                                              toItem: movieTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 10))
        constraints.append(NSLayoutConstraint(item: baseView, attribute: .bottom, relatedBy: .equal,
                                              toItem: popularityView, attribute: .bottom, multiplier: 1.0, constant: 20))
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.movieMainImageView.image = nil
        self.moviePosterImageView.image = nil
        self.movieTitleLabel.text = ""
        for label in popularityView.subviews {
            if label.isKind(of: UILabel.self) {
                (label as! UILabel).text = ""
            }
        }
    }
    
    /// Update cell content with movie model
    ///
    /// - Parameter movie: movie model for cell content
    func updateMovieDate(movie: movieModel) {
//        print("!!!! movie: ", movie.movieId as Any, movie.title as Any, movie.backdrop_path as Any, movie.poster_path as Any)
        imageDownloadHelper.sharedProvider().downloadImage(from: String(format: "%@%@", imageDownloadHelper.small_size_prefix, movie.backdropPath ?? ""), forView: movieMainImageView)
        imageDownloadHelper.sharedProvider().downloadImage(from: String(format: "%@%@", imageDownloadHelper.regular_size_prefix, movie.posterPath ?? ""), forView: moviePosterImageView)
        movieTitleLabel.text = movie.title ?? ""
        for label in popularityView.subviews {
            if label.isKind(of: UILabel.self) {
                (label as! UILabel).text = String(format:"%.2f", movie.popularity ?? 0)
            }
        }
    }

}
