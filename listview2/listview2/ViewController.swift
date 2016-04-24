//
//  ViewController.swift
//  listview2
//
//  Created by Katrina Rodriguez on 4/24/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //properties
    
    @IBOutlet var nameField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addName() {
        print("add name: ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

