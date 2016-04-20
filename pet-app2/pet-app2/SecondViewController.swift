//
//  SecondViewController.swift
//  pet-app2
//
//  Created by Katrina Rodriguez on 4/19/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var txtInput: UITextField!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var textOutputBtn: UIButton!
    
    
    
    @IBAction func buttonTapped() {
        
        let textFieldValue = self.txtInput.text
        if (textFieldValue?.characters.count > 0 ) {
            self.cityLabel.text = textFieldValue
            self.cityLabel.textColor = UIColor.lightGrayColor()
            return
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textOutputBtn.setTitle("City?", forState: .Normal)
        self.cityLabel.textColor = UIColor.clearColor()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
