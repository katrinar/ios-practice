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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movie = self.moviesArray[indexPath.row]
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = movie.title
            cell.detailTextLabel?.text = "\(movie.popularity)"
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = "\(movie.popularity)"
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

