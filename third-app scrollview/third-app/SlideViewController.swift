//
//  SlideViewController.swift
//  third-app
//
//  Created by Katrina Rodriguez on 4/17/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

//frame is location and size

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet var slideView: UIScrollView!
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slideView.contentSize = CGSize(width: 600, height: 200)
        
        //scrollview with images
        
        let firstImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        firstImg.image = UIImage(named: "dog.png")
        self.slideView.addSubview(firstImg)
        
        
        let secondImg = UIImageView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        secondImg.image = UIImage(named: "frenchie.png")
        self.slideView.addSubview(secondImg)
        
        let thirdImg = UIImageView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        thirdImg.image = UIImage(named: "mk.png")
        self.slideView.addSubview(thirdImg)
        
        var y = self.slideView.frame.origin.y+self.slideView.frame.size.height+30
        let x = CGFloat(20)
        
        let btn = UIButton(type: .Custom)
        btn.setTitle("name?", forState: .Normal)
        btn.frame = CGRect(x: x, y: y, width: self.view.frame.size.width-2*x, height: 44)
        btn.backgroundColor = UIColor.blackColor()
        btn.addTarget(self, action: #selector(SlideViewController.btnTapped(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
        y += btn.frame.size.height+30
        
        self.label = UILabel(frame: CGRect(x: x, y: y, width: self.view.frame.size.width-2*x, height: 22))
        self.label.textColor = UIColor.darkGrayColor()
        self.label.text = "woof"
        self.label.textAlignment = .Center
        self.view.addSubview(label)
        
        
        //simple scrollview with background colors
//        let firstSlide = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        self.slideView.pagingEnabled = true
//        firstSlide.backgroundColor = UIColor.blueColor()
//        self.slideView.addSubview(firstSlide)
//        
//        let secondSlide = UIView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
//        self.slideView.pagingEnabled = true
//        secondSlide.backgroundColor = UIColor.cyanColor()
//        self.slideView.addSubview(secondSlide)
//        
//        let thirdSlide = UIView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
//        self.slideView.pagingEnabled = true
//        thirdSlide.backgroundColor = UIColor.greenColor()
//        self.slideView.addSubview(thirdSlide)
        
    }
    
    func btnTapped(btn: UIButton) {
        let offset = self.slideView.contentOffset.x
        print("btn tapped: \(offset)")
        self.label.text = "take me home?"
        
        if (offset == 0){
            self.label.text = "Frankie"
        }
        if (offset == 200){
            self.label.text = "Frenchie"
        }
        if (offset == 400){
            self.label.text = "Milkshake"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
