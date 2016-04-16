//
//  HomeViewController.swift
//  test4
//
//  Created by Katrina Rodriguez on 4/16/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class HomeViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: properties
    
    var homeTable: UITableView!
    
    //MARK: Lifecycle Methods
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.homeTable = UITableView(frame: frame, style: .Plain)
        self.homeTable.delegate = self
        self.homeTable.dataSource = self
        
        
        view.addSubview(self.homeTable)
        
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: TableView Delegate Methods
    
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        //Reuse Cell
        print("resuse cell")
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        }
        
        //create new cell
        print("create cell")
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

 

}
