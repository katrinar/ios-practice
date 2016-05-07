//
//  MovieListViewController.swift
//  movies
//
//  Created by Katrina Rodriguez on 5/2/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var moviesTable: UITableView!
    var moviesArray = Array<Movie>() //declaring and instatiating array vs declaring only(with colon and !)
    
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.yellowColor()
        self.view = view
        
        self.moviesTable = UITableView(frame: frame, style: .Plain)
        self.moviesTable.delegate = self
        self.moviesTable.dataSource = self
        view.addSubview(moviesTable)
        
        
//        let avatar = Movie()
//        avatar.title = "Avatar"
//        avatar.year = "2009"
//        avatar.summary = "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home."
//        avatar.leadActor = "Sam Worthington"
//        avatar.image = "avatar.png"
//        self.moviesArray.append(avatar)
//        
//        let godfather = Movie()
//        godfather.title = "Godfather"
//        godfather.year = "1973"
//        godfather.summary = "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."
//        godfather.leadActor = "Al Pacino"
//        godfather.image = "godfather.png"
//        self.moviesArray.append(godfather)
//        
//        let toyStory = Movie()
//        toyStory.title = "Toy Story"
//        toyStory.year = "1995"
//        toyStory.summary = "A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy's room."
//        toyStory.leadActor = "Tom Hanks"
//        toyStory.image = "toystory.png"
//        self.moviesArray.append(toyStory)
//        
//        
//        let hungerGames = Movie()
//        hungerGames.title = "Hunger Games"
//        hungerGames.year = "2012"
//        hungerGames.summary = "Katniss Everdeen voluntarily takes her younger sister's place in the Hunger Games, a televised competition in which two teenagers from each of the twelve Districts of Panem are chosen at random to fight to the death."
//        hungerGames.leadActor = "Jennifer Lawrence"
//        hungerGames.image = "hungergames.png"
//        self.moviesArray.append(hungerGames)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/movie"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                //dictionary is a json object; check if json has dictionary 
                //key value pairs are dictonaries
                
                
                if let movies = json["movies"] as? Array<Dictionary<String, AnyObject>> {
//                    print("\(movies)")
                    
                    for movieDict in movies {
                        let movie = Movie()
                        //populating the object, Movie()
                        movie.title = movieDict["title"] as? String
                        movie.image = movieDict["image"] as? String
                        movie.year = movieDict["year"] as? String
                        movie.summary = movieDict["summary"] as? String
                        movie.leadActor = movieDict["leadActor"] as? String
                        self.moviesArray.append(movie) //assigning movie to Movie() array

                        print("\(movie.image)")
                        
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
            cell.textLabel?.text = movie.title+", "+movie.year
            cell.detailTextLabel?.text = movie.leadActor
            cell.imageView?.image = UIImage(named: movie.image)
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = movie.title+", "+movie.year
        cell.detailTextLabel?.text = movie.leadActor
        cell.imageView?.image = UIImage(named: movie.image)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let movie = self.moviesArray[indexPath.row]
        
        let movieprofileVC = MovieProfileViewController()
        self.navigationController?.pushViewController(movieprofileVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
