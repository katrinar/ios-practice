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

        view.addSubview(self.selectedMoviePoster)
        
        let screen = UIView(frame: frame)
        screen.backgroundColor = UIColor.blackColor()
        screen.alpha = 0.6
        view.addSubview(screen)
        
        let scrollView = UIScrollView(frame: frame)
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        
        self.movieIcon = UIImageView(image: self.selectedMovie.posterImage)
        self.movieIcon.frame = CGRect(x: 0, y: 0, width: 0.5*width, height: 0.5*height)
        self.movieIcon.center = CGPoint(x: 0.5*frame.size.width, y: 240)
        self.movieIcon.layer.borderColor = UIColor.whiteColor().CGColor
        self.movieIcon.layer.borderWidth = 3
        view.addSubview(movieIcon)
        view.addSubview(scrollView)
        
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
            frame.origin.y = -0.2*offset
            self.selectedMoviePoster.frame = frame
            return
        }
        
        offset = -1*offset
        let tx = (offset/500)+1
        self.selectedMoviePoster.transform = CGAffineTransformMakeScale(tx, tx)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
