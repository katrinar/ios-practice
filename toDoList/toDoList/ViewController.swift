//
//  ViewController.swift
//  toDoList
//
//  Created by Katrina Rodriguez on 4/24/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var textField: UITextField!
    var toDoListTable: UITableView!
    var addBtn: UIButton!
    var toDoArray: Array<String>!
    
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        self.view = view
        
        //margins
        let originX = frame.size.width * 0.5
        let originY = frame.size.height * 0.5
        
        //text field
        let textField = UITextField(frame: CGRect(x: 10, y: 40, width: originX, height: 44))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.view.addSubview(textField)
        
        //add button
//        let addBtn = UIButton(type: .Custom)
////        self.addBtn.frame = CGRect(x: originX + 80, y: 20, width: 60, height: 44)
//        self.addBtn.backgroundColor = UIColor.darkGrayColor()
//        self.addBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        self.addBtn.layer.cornerRadius = 5
//        self.addBtn.setTitle("Add", forState: .Normal)
//        self.view.addSubview(addBtn)
        
//        self.addBtn.addTarget(self,
//                              action: #selector(ViewController.addToList(_:)),
//                              forControlEvents: .TouchUpInside)
        
        
    
        //to do list table view
        self.toDoListTable = UITableView(frame: frame, style: .Plain)
        self.toDoListTable.frame = CGRect(x: 0, y: originY - 100, width: originX*2, height: originY)
        view.addSubview(toDoListTable)
        
        self.toDoListTable.delegate = self
        self.toDoListTable.dataSource = self
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
        
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
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        print("create new cell")
        return cell
    }
    
    func addToList(btn: UIButton!){
//        var task = self.textField.text
//        if (task?.characters.count == 0){
//            return //nothing entered, ignore
//        }
//        
//        self.toDoArray.append(task!)
//        self.textField.text = "" //clear text field
        print("add task: ")
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

