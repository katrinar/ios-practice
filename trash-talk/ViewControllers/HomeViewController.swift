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
        
        let originX = frame.size.width * 0.5
    
        let header = UILabel(frame: CGRect(x: originX-100, y: 20, width: 200, height: 44))
        header.text = "Trash Talk Generator"
        header.font = UIFont(name: "Impact", size: 16)
        header.textColor = UIColor.blackColor()
        header.textAlignment = .Center
        view.addSubview(header)
        
        //textfield
        let txtfield = UITextField(frame: CGRect(x: originX-80, y: 200, width: 160, height: 44))
        txtfield.layer.borderColor = UIColor.lightGrayColor().CGColor
        txtfield.layer.borderWidth = 2
        view.addSubview(txtfield)

        
        //submit btn
        let submit = UIButton(type: .Custom)
        submit.frame = CGRect(x: originX-40, y: 300, width: 80, height: 44)
        submit.layer.borderWidth = 1
        submit.layer.borderColor = UIColor.lightGrayColor().CGColor
        submit.layer.cornerRadius = 5
        submit.setImage(UIImage(named:"btnImage.png"), forState: .Normal)
        view.addSubview(submit)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
