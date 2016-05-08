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
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view = view
        view.backgroundColor = UIColor.orangeColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  

}
