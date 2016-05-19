//
//  MovieViewController.swift
//  movies-api
//
//  Created by Katrina Rodriguez on 5/15/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UIScrollViewDelegate {
    
    var selectedMovie: Movie!
    var selectedMoviePoster: UIImageView!
    var movieIcon: UIImageView!
    var scrollView: UIScrollView!
    var movieOverview: UILabel!
    
    override func loadView() {
        self.title = selectedMovie.title

        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.edgesForExtendedLayout = .None
        view.backgroundColor = UIColor.blackColor()
        
        self.selectedMoviePoster = UIImageView(image: self.selectedMovie.posterImage)
        let posterFrame = selectedMoviePoster.frame
        
        let width = frame.size.width
        let scale = width/posterFrame.size.width
        let height = scale * posterFrame.size.height
        self.selectedMoviePoster.frame = CGRect(x: 0, y: 0, width: width, height: height)

        view.addSubview(selectedMoviePoster)
        
        let screen = UIView(frame: frame)
        screen.backgroundColor = UIColor.blackColor()
        screen.alpha = 0.6
        view.addSubview(screen)
        
        let scrollView = UIScrollView(frame: frame)
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        view.addSubview(scrollView)
        
        self.movieIcon = UIImageView(image: self.selectedMovie.posterImage)
        self.movieIcon.frame = CGRect(x: 0, y: 0, width: 0.5*width, height: 0.5*height)
        self.movieIcon.center = CGPoint(x: 0.5*frame.size.width, y: 140)
        self.movieIcon.layer.borderColor = UIColor.whiteColor().CGColor
        self.movieIcon.layer.borderWidth = 3
        view.addSubview(movieIcon)
        
        let overviewY = movieIcon.frame.height
        self.movieOverview = UILabel(frame: CGRect(x: 0, y: overviewY*2, width: width-10, height: 500))
        self.movieOverview.text = selectedMovie.overview
        self.movieOverview.textAlignment = .Center
        self.movieOverview.numberOfLines = 0
        self.movieOverview.lineBreakMode = .ByWordWrapping
        self.movieOverview.textColor = UIColor.whiteColor()
        scrollView.addSubview(movieOverview)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        var offset = scrollView.contentOffset.y
        print("\(scrollView.contentOffset.y)") //o to 300
        
        if (offset > 0){
            self.selectedMoviePoster.transform = CGAffineTransformIdentity
            var frame = self.selectedMoviePoster.frame
            var movieFrame = self.movieIcon.frame
            
            frame.origin.y = -0.2*offset
            self.selectedMoviePoster.frame = frame
            self.movieIcon.frame = movieFrame
            
            var frameIcon = self.movieIcon.frame
            frameIcon.origin.y = 0.2*offset
            let tx = (offset/500)-1
            self.movieIcon.transform = CGAffineTransformMakeScale(-tx, -tx)
            
            if (offset > 400){
                print("OFFSET: target")
                scrollView.addSubview(movieIcon)
            }
        
            return
        }
        
       
        
        offset = -1*offset
        let tx = (offset/500)+1
        self.selectedMoviePoster.transform = CGAffineTransformMakeScale(tx, tx)
        view.addSubview(movieIcon)
        
        

        //homework: make icon increase by 20% when scroll down
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
