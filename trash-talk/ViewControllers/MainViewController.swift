//
//  MainViewController.swift
//  trash-talk
//
//  Created by Katrina Rodriguez on 4/21/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    override func loadView() {
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}