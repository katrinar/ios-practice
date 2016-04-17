//
//  ViewController.swift
//  third-app
//
//  Created by Katrina Rodriguez on 4/17/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

//IBOutlet connects UILabel, homeLabel to storyboard; connect from viewcontroller icon to label

//IBAction connects function to storyboard; Functions: connect from button to viewcontroller icon in storyboard

class ViewController: UIViewController {
    
//    var numTapped = 0
    
    var numTapped: Int!
    
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var homeTextField: UITextField!
    @IBOutlet var homeImg: UIImageView!
    
    
    @IBAction func buttonTapped(){
        
        let textFieldValue = self.homeTextField.text
        if (textFieldValue?.characters.count > 0) {
            self.homeLabel.text = textFieldValue
            return

        }

//        //fizbuzz example
        
        self.numTapped = self.numTapped+1
        print("buttonTapped: \(self.numTapped)")
        
        var isEven = false
        var numFive = false
        var textColor = UIColor.purpleColor()

        
        if (self.numTapped % 2 == 0) {
            isEven = true
            self.homeImg.image = UIImage(named: "dog.png")
            textColor = UIColor.yellowColor()

        }
        
        else if (self.numTapped % 5 == 0){
            numFive = true
            self.homeImg.image = UIImage(named: "mk.png")
            textColor = UIColor.greenColor()

        }
        else {
            self.homeImg.image = UIImage(named: "frenchie.png")
        }
        
    
        
        self.homeLabel.text = "Button Tapped: \(self.numTapped)"
        self.homeLabel.textColor = textColor
        
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numTapped = 0
        
        homeLabel.textAlignment = .Center
        homeLabel.text = "Dogs near you"

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

