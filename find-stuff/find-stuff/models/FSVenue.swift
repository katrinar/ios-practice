//
//  FSVenue.swift
//  find-stuff
//
//  Created by Katrina Rodriguez on 5/22/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class FSVenue: NSObject {
    
    var name: String?
    var address: String?
    
    func populate(venueInfo: Dictionary<String, AnyObject>){
        
//        print("-----Populate: \(venueInfo)---------")
        
        if let _name = venueInfo["name"] as? String {
            self.name = _name
        }
 
        if let location = venueInfo["location"] as? Dictionary<String,AnyObject>{
            if let _address = location["address"] as? String {
                self.address = _address
            }
            
            print("\(name), \(address)")
        }
    }
    

}
