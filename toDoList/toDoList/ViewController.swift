//
//  ViewController.swift
//  toDoList
//
//  Created by Katrina Rodriguez on 4/24/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var text: UITextField!
    var toDoListTable: UITableView!
    var addBtn: UIButton!
    var taskArray: Array<String>!
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view.backgroundColor = UIColor.whiteColor()
        self.view = view

    //margins
        let originX = frame.size.width * 0.5
        let originY = frame.size.height * 0.5
        
        //text field
        self.text = UITextField(frame: CGRect(x: 10, y: 40, width: originX, height: 44))
        self.text.layer.borderWidth = 1
        self.text.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.text.layer.cornerRadius = 5
        self.text.textAlignment = .Center
        self.text.textColor = UIColor.lightGrayColor()
        view.addSubview(self.text)
        
        //add button
        self.addBtn = UIButton(type: .Custom)
        self.addBtn.setTitle("add", forState: .Normal)
        self.addBtn.frame = CGRect(x: originX + 80, y: 40, width: 60, height: 44)
        self.addBtn.layer.borderColor = UIColor.blackColor().CGColor
        self.addBtn.layer.borderWidth = 1
        self.addBtn.layer.cornerRadius = 5
        self.addBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        self.addBtn.addTarget(self, action: #selector(ViewController.addToList(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(self.addBtn)
        
    
        //to do list table view
        self.toDoListTable = UITableView(frame: frame, style: .Plain)
        self.toDoListTable.frame = CGRect(x: 0, y: originY - 100, width: originX*2, height: originY)
        self.toDoListTable.delegate = self
        self.toDoListTable.dataSource = self
        view.addSubview(self.toDoListTable)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//add task to list function
    func addToList(btn: UIButton){
        print("addToList: \(self.taskArray)")
    }
    

//table view callback functions
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
        
        //if no cells to recycle, initialize new cell; setting contents; put back in tableview
        let cell = UITableViewCell(style: .Subtitle,
                                   reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        print("create new cell")
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

