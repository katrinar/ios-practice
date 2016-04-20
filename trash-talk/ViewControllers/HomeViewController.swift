//
//  HomeViewController.swift
//  trash-talk
//
//  Created by Katrina Rodriguez on 4/17/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.view = view
        
        //header
    
        let header = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 44))
        header.text = "Trash Talk Generator"
        header.textColor = UIColor.blackColor()
        header.textAlignment = .Center
        view.addSubview(header)
        
        //textfield<#T##Int#>
        let txtfield = UITextField(frame: CGRect(x: 80, y: 200, width: 160, height: 44))
        txtfield.backgroundColor = UIColor.lightGrayColor()
        
        //submit btn
        let submit = UIButton(type: .Custom)
        submit.frame = CGRect(x: 120, y: 300, width: 80, height: 44)
        submit.layer.borderWidth = 1
        submit.layer.borderColor = UIColor.lightGrayColor().CGColor
        view.addSubview(submit)
        
        
        view.addSubview(txtfield)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
