//
//  ViewController.swift
//  tableView
//
//  Created by Katrina Rodriguez on 4/25/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var firstTable: UITableView!
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view = view
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.firstTable = UITableView(frame: frame, style: .Plain)
        view.addSubview(firstTable)
        
        self.firstTable.delegate = self
        self.firstTable.dataSource = self
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellID"
        //check recycle bin for cells to reuse
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
             cell.textLabel?.text = "\(indexPath.row)"
            print("reuse cell")
            return cell
        }
        
        //if no cells to recycle, initializing new cell; setting contents; put back in tableview
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        print("create new cell")
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

