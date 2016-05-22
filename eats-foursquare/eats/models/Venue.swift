//
//  Venue.swift
//  eats
//
//  Created by Katrina Rodriguez on 5/15/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class Venue: NSObject {
    
    var name: String!
    var address: String!
    var hereNowSummary: String!
    
    func populate(info: Dictionary<String, AnyObject>){
        
        if let _name = info["name"] as? String {
            self.name = _name
        }
        
        if let _location = info["location"] as? Dictionary<String, AnyObject> {
            if let _address = _location["address"] as? String {
                self.address = _address
            }
        }
        
        if let _hereNow = info[""] as? Dictionary<String, AnyObject> {
            if let _hereNowSummary = _hereNow["summary"] as? String {
                self.hereNowSummary = _hereNowSummary
            }
            
        }
    }
}
