//
//  KRViewController.swift
//  test5
//
//  Created by Katrina Rodriguez on 4/16/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class KRViewController: testViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: petTable Properties
    
    var petTable: UITableView!
    
    //MARK: Lifecycle Methods
    
    
    override func loadView() {
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.petTable = UITableView(frame: frame, style: .Plain)
        self.petTable.delegate = self
        self.petTable.dataSource = self
        
        view.addSubview(self.petTable)
        
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: TableView Delegate Methods
    
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        //Reuse Cell
        print("reuse cell")
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        }
        
        //Create new cell
        print("create cell")
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 


}
