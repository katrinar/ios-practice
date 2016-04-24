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
    var namesArray = Array<String>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //button action
    @IBAction func addName() {
        
        
        let name = self.nameField.text
        if (name?.characters.count == 0){
            return //nothing entered, ignore
        }
        
        self.namesArray.append(name!)
        self.nameField.text = "" //clear text field
        print("add name: \(self.namesArray)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

