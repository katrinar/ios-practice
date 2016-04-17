//
//  SecondViewController.swift
//  pet-app2
//
//  Created by Katrina Rodriguez on 4/17/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.label.textColor = UIColor.blackColor()
        self.label.text = "click"
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
