//
//  FoodPlace.swift
//  eats
//
//  Created by Katrina Rodriguez on 5/8/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class FoodPlace: NSObject {
    
    var name: String!
    var vicinity: String!
    var rating: Double!
    var icon: String!
    
    func populate(info: Dictionary<String, AnyObject>){
        if let _name = info["name"] as? String {
            self.name = _name
        }
        
        if let _vicinity = info["vicinity"] as? String {
            self.vicinity = _vicinity
        }
        
        if let _rating = info["rating"] as? Double {
            self.rating = _rating
        }
        
        if let _icon = info["icon"] as? String {
            self.icon = _icon
        }
    }

}
