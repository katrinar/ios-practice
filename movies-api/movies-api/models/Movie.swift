//
//  Movie.swift
//  movies-api
//
//  Created by Katrina Rodriguez on 5/15/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var title: String!
    var popularity: Double!
    
    func populate(info: Dictionary<String, AnyObject>){
        
        if let _title = info["title"] as? String {
            self.title = _title
        }
        
        if let _popularity = info["popularity"] as? Double {
            self.popularity = _popularity
        }
    }

}
