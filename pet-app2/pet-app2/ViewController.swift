//
//  ViewController.swift
//  pet-app2
//
//  Created by Katrina Rodriguez on 4/17/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slideView: UIScrollView!
    @IBOutlet var nextBtn: UIButton!
    var header: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ScrollView
        edgesForExtendedLayout = .None
        self.slideView.contentSize = CGSize(width: 600, height: 200)
        
        
        let firstImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        firstImg.image = UIImage(named: "1.png")
        self.slideView.addSubview(firstImg)
        
        let secondImg = UIImageView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        secondImg.image = UIImage(named: "2.png")
        self.slideView.addSubview(secondImg)
        
        let thirdImg = UIImageView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        thirdImg.image = UIImage(named: "3.png")
        self.slideView.addSubview(thirdImg)
        
        //Buttons
        
        self.nextBtn.setTitle("Shelters near you", forState: .Normal)
        self.nextBtn.backgroundColor = UIColor.lightGrayColor()
        self.nextBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        
        
        //Text
        
         self.header = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 44))
        self.header.text = "Adopt a furry friend"
        self.header.textColor = UIColor.lightGrayColor()
        self.header.textAlignment = .Center
        self.view.addSubview(header)
        
       
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

