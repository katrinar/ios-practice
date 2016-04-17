//
//  ViewController.swift
//  adopt-pet-app
//
//  Created by Katrina Rodriguez on 4/17/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slideView: UIScrollView!
    @IBOutlet var nextBtn: UIButton!
    var header: UILabel!
    var subHeader: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        var y = self.slideView.frame.origin.y+self.slideView.frame.size.height+40
        let x = CGFloat(20)
        
        self.header = UILabel(frame: CGRect(x: x, y: 50, width: self.view.frame.size.width-2*x, height: 44))
        self.header.text = "Looking to adopt?"
        self.header.textColor = UIColor.lightGrayColor()
        self.header.textAlignment = .Center
        self.view.addSubview(header)
        
        self.subHeader = UILabel(frame: CGRect(x: x, y: 96, width: self.view.frame.size.width-2*x, height: 44))
        self.subHeader.text = "These guys are looking for homes!"
        self.subHeader.textColor = UIColor.lightGrayColor()
        self.subHeader.textAlignment = .Center
        self.view.addSubview(subHeader)
        
        self.nextBtn = UIButton(type: .Custom)
        self.nextBtn.setTitle("Find shelters nearby", forState: .Normal)
        self.nextBtn.frame = CGRect(x: 160, y: y, width: self.view.frame.size.width-2*x, height: 44)
        self.nextBtn.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(nextBtn)
        y += nextBtn.frame.size.height+30
        
        
    
    }
    
    func btnTapped (nextBtn: UIButton){
        print("next view: ")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

