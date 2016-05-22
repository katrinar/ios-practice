//
//  FSVenue.swift
//  find-stuff
//
//  Created by Katrina Rodriguez on 5/22/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import MapKit

class FSVenue: NSObject, MKAnnotation {
    
    var name: String?
    var address: String?
    var latitude: Double?
    var longitude: Double?
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.latitude!, self.longitude!)
    }
   
    var title: String? {
        return self.name
    }
    
    var subtitle: String? {
        return self.address
    }
    
    func populate(venueInfo: Dictionary<String, AnyObject>){
        
//        print("-----Populate: \(venueInfo)---------")
        
        if let _name = venueInfo["name"] as? String {
            self.name = _name
        }
 
        if let location = venueInfo["location"] as? Dictionary<String,AnyObject>{
            if let _address = location["address"] as? String {
                self.address = _address
            }
            
            if let lat = location["lat"] as? Double {
                self.latitude = lat
            }
            
            if let lng = location["lng"] as? Double {
                self.longitude = lng
            }
            
            print("\(name), \(address)")
        }
    }
    

}
