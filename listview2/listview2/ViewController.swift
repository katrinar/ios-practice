//
//  ViewController.swift
//  listview2
//
//  Created by Katrina Rodriguez on 4/24/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
//conforming to the delegate protocol = add UIScrollViewDelegate to ViewController

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //properties
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var imagesScroll: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
     var namesArray = Array<String>()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstSlide = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        firstSlide.backgroundColor = UIColor.lightGrayColor()
        self.imagesScroll.addSubview(firstSlide)
        
        let secondSlide = UIView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        secondSlide.backgroundColor = UIColor.greenColor()
        self.imagesScroll.addSubview(secondSlide)
        
        let thirdSlide = UIView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        thirdSlide.backgroundColor = UIColor.blueColor()
        self.imagesScroll.addSubview(thirdSlide)
        
        self.imagesScroll.contentSize = CGSize(width: 600, height: 0)
        self.imagesScroll.delegate = self
        
    
    }
    
    //delegate callback method
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
     
        
        let offset = scrollView.contentOffset.x
//           print("scrollViewDidScroll: \(offset)")
        
        if (offset < 100){
            self.view.backgroundColor = UIColor.yellowColor()
            self.pageControl.currentPage = 0

        }
        else if (offset < 300){
            self.view.backgroundColor = UIColor.lightGrayColor()
            self.pageControl.currentPage = 1
        }
        
        else {
            self.pageControl.currentPage = 2
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        let offset = scrollView.contentOffset.x
        print("scrollViewDidEndDecelerating: \(offset)")
        
        if (offset == 0){
            print("First Page")
//            self.pageControl.currentPage = 0
        }
        if (offset == 200){
            print("Second Page")
//            self.pageControl.currentPage = 1
        }
        if (offset == 400){
            print("Third Page")
            
        }
    }
    
    //button action
    @IBAction func addName() {
        
        
        let name = self.nameField.text
        if (name?.characters.count == 0){
            return //nothing entered, ignore
        }
        
        self.namesArray.append(name!)
        self.nameField.text = "" //clear text field
        print("add name: \(self.namesArray)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

