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
        var textField = UITextField(frame: CGRect(x: originX, y: originY * 0.5, width: 160, height: 44))
        self.view.addSubview(textField)
    
        //to do list table view
        self.toDoListTable = UITableView(frame: frame, style: .Plain)
        view.addSubview(toDoListTable)
        self.toDoListTable.delegate = self
        self.toDoListTable.dataSource = self
        
    }
    
    func addToList(){
        let task = self.textField.text
        if (task?.characters.count == 0){
            return //nothing entered, ignore
        }
        
        self.toDoArray.append(task!)
        self.textField.text = "" //clear text field
        print("add task: \(self.toDoArray)")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellID"
        //check recycle bin for cells to reuse
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            cell.textLabel?.text = self.toDoArray[indexPath.row]
            print("reuse cell")
            return cell
        }
        
        //if no cells to recycle, initializing new cell; setting contents; put back in tableview
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = self.toDoArray[indexPath.row]
        print("create new cell")
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

