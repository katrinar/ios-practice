//
//  MovieProfileViewController.swift
//  movies
//
//  Created by Katrina Rodriguez on 5/7/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
import Alamofire

class MovieProfileViewController: UIViewController {
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view = view
        view.backgroundColor = UIColor.whiteColor()
        
    }
    
    //MARK - make JSON request for movie details

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
