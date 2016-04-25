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
    var candidates = Array<Candidate>()
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view = view
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.firstTable = UITableView(frame: frame, style: .Plain)
        view.addSubview(firstTable)
        
        self.firstTable.delegate = self
        self.firstTable.dataSource = self
        
        let donaldTrump = Candidate()
        donaldTrump.name = "donald trump"
        donaldTrump.party = "republican"
        donaldTrump.state = "ny"
        donaldTrump.gender = "m"
        donaldTrump.age = 70
        self.candidates.append(donaldTrump)
        
        let hillaryClinton = Candidate()
        hillaryClinton.name = "hillary clinton"
        hillaryClinton.party = "democrat"
        hillaryClinton.state = "ny"
        hillaryClinton.gender = "f"
        hillaryClinton.age = 68
        self.candidates.append(hillaryClinton)
        
        
        let bernieSanders = Candidate()
        bernieSanders.name = "bernie sanders"
        bernieSanders.party = "democrat"
        bernieSanders.state = "vt"
        bernieSanders.gender = "m"
        bernieSanders.age = 68
        self.candidates.append(bernieSanders)
        
        let johnKasich = Candidate()
        johnKasich.name = "john kasich"
        johnKasich.party = "republican"
        johnKasich.state = "oh"
        johnKasich.gender = "m"
        johnKasich.age = 68
        self.candidates.append(johnKasich)
        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.candidates.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let candidate = self.candidates[indexPath.row]
        
        let cellId = "cellID"
        //check recycle bin for cells to reuse
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            cell.textLabel?.text = candidate.name+", "+candidate.party
            cell.detailTextLabel?.text = candidate.state
            print("reuse cell")
            return cell
        }
        
        //if no cells to recycle, initializing new cell; setting contents; put back in tableview
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = candidate.name+", "+candidate.party
        cell.detailTextLabel?.text = candidate.state
        print("create new cell")
        return cell
    }

   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

