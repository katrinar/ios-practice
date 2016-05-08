//
//  ShowsListViewController.swift
//  tv-shows
//
//  Created by Katrina Rodriguez on 5/8/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire

class ShowsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var showsTable: UITableView!
    var showList = Array<Dictionary<String, AnyObject>>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/show"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                print("\(json)")
                
                if let shows = json["shows"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for showInfo in shows {
                        self.showList.append(showInfo)
                    }
                    
                    self.showsTable.reloadData()
                }
            }
        }
    }
    
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.showList.count
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tvShow = self.showList[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath)
        cell.textLabel?.text = tvShow["title"] as? String
        cell.detailTextLabel?.text = tvShow["network"] as? String
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
