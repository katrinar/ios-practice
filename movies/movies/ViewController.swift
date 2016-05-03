//
//  ViewController.swift
//  movies
//
//  Created by Katrina Rodriguez on 5/2/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func watchBtnTapped(){
        
    let movieListCtr = MovieListViewController()
    self.navigationController?.pushViewController(movieListCtr, animated: true)
    
    print("watchBtnTapped")
    
    }
    
    @IBAction func concertBtnTapped() {
        
        let bandListCtr = BandListViewController()
        self.navigationController?.pushViewController(bandListCtr, animated: true)
        
        print("concertBtnTapped")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

