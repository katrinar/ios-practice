//
//  testHomeViewController.swift
//  test5
//
//  Created by Katrina Rodriguez on 4/16/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class testHomeViewController: testViewController {
    
    var homeBtn: UIButton!
        
    var welcomeLabel: UILabel!
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.lightGrayColor()
        
        //welcome text
        
        let welcomeLabel = UILabel(frame: CGRect(x: 60, y: 100, width: 200, height: 44))
        welcomeLabel.text = ("Hi There")
       
        view.addSubview(welcomeLabel)

        
        //home button for first action
        
        let homeBtn = UIButton(type: .Custom)
        homeBtn.frame = CGRect(x: 60, y: 300, width: 200, height: 44)
        homeBtn.layer.borderWidth = 1
        homeBtn.layer.borderColor = UIColor.darkGrayColor().CGColor
        homeBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        homeBtn.setTitle("Rescue a pet!", forState: .Normal)
        
        view.addSubview(homeBtn)
        
        homeBtn.addTarget(self, action: #selector(testHomeViewController.nextAction(_:)), forControlEvents: .TouchUpInside)
    
        
        self.view = view
    }
    
    // home button action
    
    func nextAction (btn: UIButton){
        print("nextAction: ")
        
        let nextCtr = KRViewController()
        self.navigationController?.pushViewController(nextCtr, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
