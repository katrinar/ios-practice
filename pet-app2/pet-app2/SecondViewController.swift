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
    @IBOutlet var cityImg: UIImageView!
    
    @IBAction func buttonTapped() {
        
        let textFieldValue = self.txtInput.text
        if (textFieldValue?.characters.count > 0 ) {
            self.cityLabel.text = textFieldValue?.capitalizedString
            self.cityLabel.textColor = UIColor.lightGrayColor()
            
            if (textFieldValue?.lowercaseString == "new york") {
                self.cityImg.image = UIImage(named: "fourth.png")
            }
            else {
                self.cityImg.image = UIImage(named: "second.png")
            }

            
            return
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //text field properties
        self.txtInput.layer.borderWidth = 2
        self.txtInput.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        //button properties
        self.textOutputBtn.setTitle("City?", forState: .Normal)
        self.textOutputBtn.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.textOutputBtn.layer.borderWidth = 1
        self.textOutputBtn.layer.cornerRadius = 5
        self.textOutputBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        
        //label properties
        self.cityLabel.textColor = UIColor.clearColor()
        
        //UIImageView properties
        self.cityImg.image = UIImage(named: "second.png")
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
