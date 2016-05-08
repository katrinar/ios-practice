//
//  ViewController.swift
//  eats
//
//  Created by Katrina Rodriguez on 5/8/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var locationManager: CLLocationManager!
    var foodTable: UITableView!
    var foodList = Array<Dictionary<String, AnyObject>>()
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        edgesForExtendedLayout = .None
        view.backgroundColor = UIColor.whiteColor()
        self.view = view
        

        self.foodTable = UITableView(frame: frame, style: .Plain)
        self.foodTable.delegate = self
        self.foodTable.dataSource = self
        view.addSubview(foodTable)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentLocation = locations[0]
        self.locationManager.stopUpdatingLocation()
        print("didUpdateLocations: \(currentLocation)")
        
        //AIzaSyAUvVPZt_C-LmO5IhVfGFuuDgjIKhgfCQw
        
        let latLng = "\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)"
        
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latLng)&radius=500&types=food&key=AIzaSyAUvVPZt_C-LmO5IhVfGFuuDgjIKhgfCQw"
        
        print("URL = \(url)")
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
         
            if let json = response.result.value as? Dictionary<String, AnyObject> {
//                print("\(json)")
            
                if let results = json["results"] as? Array<Dictionary<String, AnyObject>>{
//                    print("\(results)")
                    
                    for venue in results {
                        self.foodList.append(venue)
                        print("\(venue)")
                    }
                    
                    self.foodTable.reloadData()
                }
            }
        }

    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus){
        print("didChangeAuthorizationStatus")
        if (status == .AuthorizedWhenInUse){
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let venue = self.foodList[indexPath.row]
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = venue["name"] as? String
            cell.detailTextLabel?.text = venue["vicinity"] as? String
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = venue["name"] as? String
        cell.detailTextLabel?.text = venue["vicinity"] as? String

        return cell
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

