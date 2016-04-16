//
//  TestHomeViewController.swift
//  Test2
//
//  Created by Katrina Rodriguez on 4/16/16.
//  Copyright © 2016 Nooks&Grannies. All rights reserved.
//

import UIKit

class TestHomeViewController: Test2ViewController {
    
    var homeToggle: UISwitch!
    
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.lightGrayColor()
        
        self.homeToggle = UISwitch(frame: CGRect(x: 150, y: 50, width: 30, height: 44))
        view.addSubview(homeToggle)
        
        
        self.homeToggle.addTarget(self, action:#selector(homeTog), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view = view
        
    }
    
    func homeTog(switchState: UISwitch) {
        if switchState.on {
            print("homeToggle: on")
            
        } else{
            print("homeToggle: off")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
