//
//  FSViewController.swift
//  find-stuff
//
//  Created by Katrina Rodriguez on 5/22/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire

class FSViewController: UIViewController, CLLocationManagerDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var bottomView: UIView!
    var searchField: UITextField!
    
    
    override func loadView() {
        self.edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        self.view = view
        
        self.mapView = MKMapView(frame: frame)
//        self.mapView.centerCoordinate = CLLocationCoordinate2DMake(40.7414562, -73.9888253)
//        let regionRadius = CLLocationDistance(500)
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(self.mapView.centerCoordinate, regionRadius, regionRadius)
//        self.mapView.setRegion(coordinateRegion, animated: true)
        view.addSubview(mapView)
        
        
        let height = CGFloat(44)
        let width = frame.size.width
//        let y = frame.size.height-height
        let y = frame.size.height //offscreen bounds; will animate in
        self.bottomView = UIView(frame: CGRect(x: 0, y: y, width: width, height: height))
        self.bottomView.autoresizingMask = .FlexibleTopMargin
        self.bottomView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.addSubview(bottomView)
        
        let padding = CGFloat(6)
        let btnWidth = CGFloat(80)
        
        self.searchField = UITextField(frame: CGRect(x: padding, y: padding, width: width-2*padding-btnWidth, height: height-2*padding))
        self.searchField.borderStyle = .RoundedRect
        self.searchField.placeholder = "what are you looking for?"
        self.bottomView.addSubview(self.searchField)
        
        let btnSearch = UIButton(type: .Custom)
        btnSearch.frame = CGRect(x: width-btnWidth, y: padding, width: 74, height: height-2*padding)
        btnSearch.setTitle("Search", forState: .Normal)
        btnSearch.backgroundColor = UIColor.lightGrayColor()
        btnSearch.layer.cornerRadius = 5
        btnSearch.layer.masksToBounds = true
        btnSearch.layer.borderColor = UIColor.darkGrayColor().CGColor
        btnSearch.layer.borderWidth = 0.5
        self.bottomView.addSubview(btnSearch)
        let action = #selector(FSViewController.searchVenues(_:))
        btnSearch.addTarget(self, action: action, forControlEvents: .TouchUpInside)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func searchVenues(btn: UIButton){
        var searchText = self.searchField.text!
        if (searchText.characters.count == 0){
            searchText = "food"
        }
        
        let currentLocation = self.mapView.centerCoordinate
        print("Current Location: \(currentLocation)")
        
        let latLng = "\(currentLocation.latitude),\(currentLocation.longitude)"
        
        let url = "https://api.foursquare.com/v2/venues/search?v=20140806&ll=\(latLng)&query=\(searchText)&client_id=VZZ1EUDOT0JYITGFDKVVMCLYHB3NURAYK3OHB5SK5N453NFD&client_secret=UAA15MIFIWVKZQRH22KPSYVWREIF2EMMH0GQ0ZKIQZC322NZ"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                print("\(json)")
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == .AuthorizedWhenInUse){
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        print("didUpdateLocations: \(location)")
        self.locationManager.stopUpdatingLocation()
        
        let coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        self.mapView.centerCoordinate = coordinate
        let regionRadius = CLLocationDistance(500)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(self.mapView.centerCoordinate, regionRadius, regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
        
        UIView.animateWithDuration(0.4, animations: {
            var bottomFrame = self.bottomView.frame
            bottomFrame.origin.y = bottomFrame.origin.y-self.bottomView.frame.size.height
            self.bottomView.frame = bottomFrame
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
