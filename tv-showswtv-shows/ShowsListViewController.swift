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
//    var showList = Array<Dictionary<String, AnyObject>>()
    var showList = Array<TVShow>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/show"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                print("\(json)")
                
                if let shows = json["shows"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for showInfo in shows {
                        var show = TVShow()
                        show.populate(showInfo)
                        self.showList.append(show)
                        
//below now populated by populate function inside model file
//                        show.title = showInfo["title"] as? String
//                        show.network = showInfo["network"] as? String
//                        show.summary = showInfo["summary"] as? String
//                        show.cast = showInfo["cast"] as? Array<String>
                
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
//        cell.textLabel?.text = tvShow["title"] as? String
//        cell.detailTextLabel?.text = tvShow["network"] as? String
        cell.textLabel?.text = tvShow.title
        cell.detailTextLabel?.text = tvShow.network
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let showViewCtr = ShowDetailViewController()
        self.navigationController?.pushViewController(showViewCtr, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
