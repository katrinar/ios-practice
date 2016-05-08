//
//  MovieProfileViewController.swift
//  movies
//
//  Created by Katrina Rodriguez on 5/7/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire

class MovieProfileViewController: UIViewController {
    
    var moviesArray = Array<Movie>() //declaring and instatiating array vs declaring only(with colon and !)
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view = view
        view.backgroundColor = UIColor.whiteColor()
        
    }
    
    //MARK - make JSON request for movie details

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
                    
                    
                }
                
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
