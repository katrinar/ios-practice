//
//  ShowDetailViewController.swift
//  tv-shows
//
//  Created by Katrina Rodriguez on 5/8/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire

class ShowDetailViewController: UIViewController {
    
    var header: UILabel!
    var image: UIImageView!
    var summary: UILabel!
    var tvShow: TVShow!
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view = view
        view.backgroundColor = UIColor.orangeColor()
        

        let originX = frame.width * 0.5
        
        self.header = UILabel(frame: (CGRect(x: originX - 100, y: 100, width: 200, height: 44)))
        self.header.text = tvShow.title
        self.header.textColor = UIColor.blackColor()
        self.header.textAlignment = .Center
        view.addSubview(header)
        
        self.image = UIImageView(frame: CGRect(x: originX-100, y: 200, width: 200, height: 200))
        
        self.summary = UILabel(frame: CGRect(x: originX-150, y: 300, width: 300, height: 300))
        self.summary.text = tvShow.summary
        self.summary.textAlignment = .Center
        self.summary.numberOfLines = 0
        self.summary.lineBreakMode = .ByWordWrapping
        view.addSubview(summary)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
