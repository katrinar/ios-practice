//
//  Movie.swift
//  movies-api
//
//  Created by Katrina Rodriguez on 5/15/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire


class Movie: NSObject {
    
    var title: String?
    var poster: String?
    var overview: String?
    var popularity: Double?
    var posterImage: UIImage?
    var isFetchingImage = false
    
    func fetchPosterImage() {
        if (self.poster == nil){
            //no poster, ignore
            return
        }
        
        self.isFetchingImage = true
        let url = "http://image.tmdb.org/t/p/w500/"+self.poster!
        Alamofire.request(.GET, url, parameters: nil).response { (request, response, data, error) in
            self.isFetchingImage = false
            if (error != nil){
                return
            }
            
            if (self.isFetchingImage == true){
                return
            }
            
            let image = UIImage(data: data!)
            self.posterImage = image
            
            let notificationCenter = NSNotificationCenter.defaultCenter()
            let notifcation = NSNotification(name: Constants.kImageDownloadedNotification, object: nil)
            notificationCenter.postNotification(notifcation)
        }
        
    }
    
    func populate(info: Dictionary<String, AnyObject>){
        
        if let _title = info["title"] as? String {
            self.title = _title
        }
        //image path request: http://image.tmdb.org/t/p/w500/zSouWWrySXshPCT4t3UKCQGayyo.jpg
        //http://image.tmdb.org/t/p/w500/{{ poster path }}
        
        if let _poster = info["poster_path"] as? String {
            self.poster = _poster
        }
        
        if let _overview = info["overview"] as? String {
            self.overview = _overview
        }
        
        if let _popularity = info["popularity"] as? Double {
            self.popularity = _popularity
        }
    }

}
