//
//  ShowDetailViewController.swift
//  tv-shows
//
//  Created by Katrina Rodriguez on 5/8/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire

class ShowDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var image: UIImageView!
    var summary: UILabel!
    var tvShow: TVShow!
    var castTable: UITableView!
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.edgesForExtendedLayout = .None
        self.view = view
        view.backgroundColor = UIColor.orangeColor()
        
        self.title = self.tvShow.title

        let originX = frame.width * 0.5
        
        self.image = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.image.center = CGPoint(x: 0.5*frame.size.width, y: 90)
        self.image.backgroundColor = UIColor.yellowColor()
        view.addSubview(image)
        
        var y = image.frame.origin.y+image.frame.size.height+20
        let font = UIFont(name:"Arial", size: 14)
        
        let str = NSString(string: self.tvShow.summary)
        let bounds = str.boundingRectWithSize(CGSizeMake(frame.size.width-40, 300), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font!], context: nil)
       
        self.summary = UILabel(frame: CGRect(x: originX-150, y: y, width: frame.size.width-40, height: bounds.size.height))
        self.summary.text = tvShow.summary
        self.summary.numberOfLines = 0
        self.summary.lineBreakMode = .ByWordWrapping
        self.summary.font = font
        view.addSubview(summary)
        
        y += summary.frame.size.height+20
        
        let tableFrame = CGRect(x: 0, y: y, width: frame.size.width, height: frame.size.height-y)
        
        self.castTable = UITableView(frame: tableFrame, style: .Plain)
        self.castTable.autoresizingMask = .FlexibleHeight
        self.castTable.dataSource = self
        self.castTable.delegate = self
        view.addSubview(castTable)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tvShow.cast.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let actor = self.tvShow.cast[indexPath.row]
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = actor.capitalizedString

            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = actor.capitalizedString
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cast Members"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
