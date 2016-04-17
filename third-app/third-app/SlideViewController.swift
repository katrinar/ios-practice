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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slideView.contentSize = CGSize(width: 600, height: 200)
        
        let firstSlide = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        firstSlide.backgroundColor = UIColor.blueColor()
        self.slideView.addSubview(firstSlide)
        
        let secondSlide = UIView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        secondSlide.backgroundColor = UIColor.cyanColor()
        self.slideView.addSubview(secondSlide)
        
        let thirdSlide = UIView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        self.slideView.pagingEnabled = true
        thirdSlide.backgroundColor = UIColor.greenColor()
        self.slideView.addSubview(thirdSlide)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    


}
