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
        donaldTrump.image = "trump.png"
        donaldTrump.bio = "Donald John Trump (born June 14, 1946) is an American businessman, politician, television personality, author, and candidate for the Republican nomination for President of the United States in the 2016 election. Trump is the Chairman and President of The Trump Organization, as well as the founder of the gaming and hotel enterprise, Trump Entertainment Resorts, now owned by Carl Icahn."
        donaldTrump.age = 69
        self.candidates.append(donaldTrump)
        
        let hillaryClinton = Candidate()
        hillaryClinton.name = "hillary clinton"
        hillaryClinton.party = "democrat"
        hillaryClinton.state = "ny"
        hillaryClinton.gender = "f"
        hillaryClinton.image = "clinton.png"
        hillaryClinton.bio = "Hillary Diane Rodham Clinton (born October 26, 1947) is an American politician. She is a candidate for the Democratic nomination for President of the United States in the 2016 election. She was the 67th United States Secretary of State from 2009 to 2013. From 2001 to 2009, Clinton served as a United States Senator from New York. She is the wife of the 42nd President of the United States Bill Clinton, and was First Lady of the United States during his tenure from 1993 to 2001."
        hillaryClinton.age = 68
        self.candidates.append(hillaryClinton)
        
        let bernieSanders = Candidate()
        bernieSanders.name = "bernie sanders"
        bernieSanders.party = "democrat"
        bernieSanders.state = "vt"
        bernieSanders.gender = "m"
        bernieSanders.image = "sanders.png"
        bernieSanders.bio = "Bernard Sanders (born September 8, 1941) is an American politician and the junior United States senator from Vermont. He is a candidate for the Democratic nomination for President of the United States in the 2016 election. A member of the Democratic Party since 2015,[2] Sanders had been the longest-serving independent in U.S. congressional history, though his caucusing with the Democrats entitled him to committee assignments and at times gave Democrats a majority. Sanders became the ranking minority member on the Senate Budget Committee in January 2015; he had previously served for two years as chair of the Senate Veterans' Affairs Committee. A self-proclaimed democratic socialist, Sanders is pro-labor and favors greater economic equality."
        bernieSanders.age = 74
        self.candidates.append(bernieSanders)
        
        let johnKasich = Candidate()
        johnKasich.name = "john kasich"
        johnKasich.party = "republican"
        johnKasich.state = "oh"
        johnKasich.gender = "m"
        johnKasich.image = "kasich.png"
        johnKasich.bio = "John Richard Kasich (born May 13, 1952) is an American politician and the current governor of Ohio, first elected in 2010 and re-elected in 2014. Kasich served nine terms as a member of the United States House of Representatives, representing Ohio's 12th congressional district from 1983 to 2001.[5] His tenure in the House included 18 years on the House Armed Services Committee and six years as chairman of the House Budget Committee. He was a key figure in the passage of both welfare reform and the Balanced Budget Act of 1997."
        johnKasich.age = 63
        self.candidates.append(johnKasich)
        
        let tedCruz = Candidate()
        tedCruz.name = "ted cruz"
        tedCruz.party = "republican"
        tedCruz.state = "tx"
        tedCruz.gender = "m"
        tedCruz.image = "cruz.png"
        tedCruz.bio = "Rafael Edward Cruz (born December 22, 1970) is an American politician and the junior United States Senator from Texas. He served as Solicitor General of Texas, from 2003 to 2008, appointed by Texas Attorney General, Greg Abbott. "
        tedCruz.age = 45
        self.candidates.append(tedCruz)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //refacting 
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        let candidate = self.candidates[indexPath.row]

        cell.textLabel?.text = candidate.name.capitalizedString+", "+candidate.party.capitalizedString
        cell.detailTextLabel?.text = candidate.state
        cell.textLabel?.textColor = (candidate.party == "democrat") ? .blueColor() : .redColor()
        cell.imageView?.image = UIImage(named: candidate.image) //lazy loading
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.candidates.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let candidate = self.candidates[indexPath.row]
        
        let cellId = "cellID"
        //check recycle bin for cells to reuse
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            print("reuse cell")
            return self.configureCell(cell, indexPath: indexPath)
            
          
        }
        
        //if no cells to recycle, initializing new cell; setting contents; put back in tableview
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
         print("create new cell")
        return self.configureCell(cell, indexPath: indexPath)
      
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let candidate = self.candidates[indexPath.row]
        
        let candidateController = CandidateViewController()
        
        candidateController.candidate = candidate
        self.navigationController?.pushViewController(candidateController, animated: true)
        
        print("didSelectRowAtIndexPath: \(candidate.name)")
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

