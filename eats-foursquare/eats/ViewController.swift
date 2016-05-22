//
//  ViewController.swift
//  eats
//
//  Created by Dan Kwon on 5/8/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var locationManager: CLLocationManager!
    var foodTable: UITableView!
    var venues = Array<Venue>()
    
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
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        print("didChangeAuthorizationStatus")
        if (status == .AuthorizedWhenInUse){
            print("AuthorizedWhenInUse")
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let currentLocation = locations[0]
        self.locationManager.stopUpdatingLocation()
        print("didUpdateLocations: \(currentLocation)")
        //make sure location simulator is on
        
        let latLng = "\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)"
        
        let url = "https://api.foursquare.com/v2/venues/search?v=20140806&ll=\(latLng)&client_id=VZZ1EUDOT0JYITGFDKVVMCLYHB3NURAYK3OHB5SK5N453NFD&client_secret=UAA15MIFIWVKZQRH22KPSYVWREIF2EMMH0GQ0ZKIQZC322NZ"
//        print("URL: \(url)")
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let json = response.result.value as? Dictionary<String, AnyObject> {
//                print("\(json)")
                
                if let resp = json["response"] as? Dictionary<String, AnyObject>{
//                    print("\(resp)")
                    
                    if let venues = resp["venues"] as? Array<Dictionary<String, AnyObject>>{
                        print("\(venues)")
                        
                        for venueInfo in venues {
                            let venue = Venue()
                            venue.populate(venueInfo)
                            self.venues.append(venue)
                        }
                        self.foodTable.reloadData()
                    }
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let venue = self.venues[indexPath.row]
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = venue.name
            cell.detailTextLabel?.text = venue.address
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
            cell.textLabel?.text = venue.name
            cell.detailTextLabel?.text = venue.address
            return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let venues = self.venues[indexPath.row]
        let venueViewCtr = VenueViewController()
        self.navigationController?.pushViewController(venueViewCtr, animated: true)
        
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

