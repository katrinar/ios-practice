//
//  FSTableViewController.swift
//  find-stuff
//
//  Created by Katrina Rodriguez on 5/22/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire

class FSTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var venues = Array<FSVenue>()
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        self.view = view
        
        self.tableView = UITableView(frame: frame, style: .Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        view.addSubview(tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - TableView
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
