//
//  ViewController.swift
//  movies-api
//
//  Created by Katrina Rodriguez on 5/15/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var moviesTable: UITableView!
    var moviesArray = Array<Movie>()
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        self.view = view
        
        self.moviesTable = UITableView(frame: frame, style: .Plain)
        self.moviesTable.delegate = self
        self.moviesTable.dataSource = self
        view.addSubview(moviesTable)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()

        notificationCenter.addObserver(self,
                                       selector: #selector(ViewController.refreshView),
                                       name: Constants.kImageDownloadedNotification,
                                       object: nil)
        
        let url = "http://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=98b525225a2fe71d855108eca4fdf12d"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON {
            response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                print(json)
                
                if let results = json["results"] as? Array<Dictionary<String, AnyObject>>{
                    
                    for movieInfo in results {
                        let movie = Movie()
                        movie.populate(movieInfo)
                        self.moviesArray.append(movie)
                    }
                    self.moviesTable.reloadData()
                }
            }
        }
    }
    
    func refreshView(){
        self.moviesTable.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movie = self.moviesArray[indexPath.row]
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = movie.title
            let rating = String(format: "%.01f", movie.popularity!)
            cell.detailTextLabel?.text = "\(rating)"
            if (movie.posterImage != nil){
                cell.imageView?.image = movie.posterImage
                return cell
            }
            
            movie.fetchPosterImage()
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = movie.title
        let rating = String(format: "%.01f", movie.popularity!)
        cell.detailTextLabel?.text = "\(rating)"
        if (movie.posterImage != nil){
            cell.imageView?.image = movie.posterImage
            return cell
        }
        
        movie.fetchPosterImage()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let movie = self.moviesArray[indexPath.row]
        let movieViewCtr = MovieViewController()
        movieViewCtr.selectedMovie = movie
        self.navigationController?.pushViewController(movieViewCtr, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

