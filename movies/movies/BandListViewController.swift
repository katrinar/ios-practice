//
//  BandListViewController.swift
//  movies
//
//  Created by Katrina Rodriguez on 5/2/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire

class BandListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var bandsTable: UITableView!
    var bandsArray = Array<Band>()
    
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.yellowColor()
        self.view = view
        
        self.bandsTable = UITableView(frame: frame, style: .Plain)
        self.bandsTable.delegate = self
        self.bandsTable.dataSource = self
        view.addSubview(bandsTable)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/band"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                //dictionary is a json object; check if json has dictionary
                //key value pairs are dictonaries
                
                
                if let bands = json["bands"] as? Array<Dictionary<String, AnyObject>> {
                    //                    print("\(movies)")
                    
                    for bandDict in bands {
                        let band = Band()
                        //populating the object, Movie()
                        band.title = bandDict["title"] as? String
                        band.image = bandDict["image"] as? String
                        band.country = bandDict["country"] as? String
                        band.leadSinger = bandDict["leadSinger"] as? String
                        band.tour = bandDict["tour"] as? String
                        self.bandsArray.append(band)
                        
                        //show tour values on profile page
                        
                        print("\(band.title)")
                        
                    }
                    
                    self.bandsTable.reloadData()
                }
                
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bandsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let band = self.bandsArray[indexPath.row]
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = band.title
            cell.detailTextLabel?.text = band.leadSinger
            cell.imageView?.image = UIImage(named: band.image)
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = band.title
        cell.detailTextLabel?.text = band.leadSinger
        cell.imageView?.image = UIImage(named: band.image)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
