//
//  MainViewController.swift
//  trash-talk
//
//  Created by Katrina Rodriguez on 4/21/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    var infoHeader: UILabel!
    
    override func loadView() {
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.view = view
        
        //margins
        
        let originX = frame.size.width * 0.5
        let originY = frame.size.height * 0.5
        
        //infoLabel
        let infoHeader = UILabel(frame: CGRect(x: originX-100, y: 20, width: 200, height: 44))
        infoHeader.text = "powered by fizzbuzz"
        infoHeader.font = UIFont(name: "HiraginoSans-W3", size: 12)
        infoHeader.textColor = UIColor.darkGrayColor()
        infoHeader.textAlignment = .Center
        view.addSubview(infoHeader)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}