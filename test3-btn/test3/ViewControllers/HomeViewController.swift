//
//  HomeViewController.swift
//  test3
//
//  Created by Katrina Rodriguez on 4/16/16.
//  Copyright © 2016 Nooks&Grannies. All rights reserved.
//

import UIKit

class HomeViewController: TestViewController {
    
    var homeBtn: UIButton!
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.cyanColor()
        
        let homeBtn = UIButton(type: .Custom)
        homeBtn.frame = CGRect(x: 150, y: 300, width: 200, height: 44)
        homeBtn.layer.borderWidth = 1
        homeBtn.layer.borderColor = UIColor.blueColor().CGColor
        homeBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        homeBtn.setTitle("click me", forState: .Normal)
        
        view.addSubview(homeBtn)
        
        homeBtn.addTarget(self, action: #selector(HomeViewController.nextAction(_:)), forControlEvents: .TouchUpInside)
        
        self.view = view
    
    }
    
    
    func nextAction(btn: UIButton){
        print("Next Action")

        
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
