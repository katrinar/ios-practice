//
//  ListViewController.swift
//  listview2
//
//  Created by Katrina Rodriguez on 4/24/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    override func loadView() {
//        self.edgesForExtendedLayout = .None
//        let frame = UIScreen.mainScreen().bounds
//        let view = UIView(frame: frame)
//        self.view = view
//        view.backgroundColor = UIColor.yellowColor()
//        
//        
//        
//        let scrollView = UIScrollView(frame: frame)
//        scrollView.backgroundColor = UIColor.blueColor()
//        view.addSubview(scrollView)
//        
//        
//        let width = frame.size.width-40
//        var y = CGFloat(100)
//        
//        for i in 0...10{
//            let btn = UIButton(frame: CGRect(x: 20, y: y, width: width, height: 44))
//            btn.backgroundColor = UIColor.orangeColor()
//            scrollView.addSubview(btn)
//            y += 64
//        }
//        
//        scrollView.contentSize = CGSize(width: 0, height: y+64)
//
//        
//    }
    
    var namesTable: UITableView!
    var namesArray: Array<String>!
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view = view
        self.view.backgroundColor = UIColor.yellowColor()
        
        self.namesTable = UITableView(frame: frame, style: .Plain)
        view.addSubview(namesTable)
        
        self.namesTable.delegate = self
        self.namesTable.dataSource = self
        
//        self.namesArray = ["donald trump", "hillary clinton", "bernie sanders", "ted cruz"]
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.namesArray.count
        
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellID"
        //check recycle bin for cells to reuse
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            cell.textLabel?.text = self.namesArray[indexPath.row]
            print("reuse cell")
            return cell
        }
        
        //if no cells to recycle, initializing new cell; setting contents; put back in tableview
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = self.namesArray[indexPath.row]
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
