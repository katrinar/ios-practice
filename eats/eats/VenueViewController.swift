//
//  VenueViewController.swift
//  eats
//
//  Created by Katrina Rodriguez on 5/10/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class VenueViewController: UIViewController {
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        edgesForExtendedLayout = .None
        self.view = view
        view.backgroundColor = UIColor.whiteColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   }
