//
//  ViewController.swift
//  listview2
//
//  Created by Katrina Rodriguez on 4/24/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit
//conforming to the delegate protocol = add UIScrollViewDelegate to ViewController

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    //properties
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var imagesScroll: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    var namesArray = Array<String>()
    let listCtr = ListViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let action = #selector(ViewController.showListView(_:))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next",
                                                                 style: .Plain,
                                                                 target: self,
                                                                 action: action)
        
        
        let firstSlide = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        firstSlide.backgroundColor = UIColor.redColor()
        self.imagesScroll.addSubview(firstSlide)
        
        let secondSlide = UIView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        secondSlide.backgroundColor = UIColor.greenColor()
        self.imagesScroll.addSubview(secondSlide)
        
        let thirdSlide = UIView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        thirdSlide.backgroundColor = UIColor.blueColor()
        self.imagesScroll.addSubview(thirdSlide)
        
        self.imagesScroll.contentSize = CGSize(width: 600, height: 0)
        self.imagesScroll.delegate = self
        
        self.nameField.delegate = self
    
    }
    
    func showListView(btn: UIBarButtonItem){
        print("showListView: ")
        listCtr.namesArray = self.namesArray
        self.navigationController?.pushViewController(listCtr, animated: true)
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
            self.view.backgroundColor = UIColor.cyanColor()
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn: ")
        textField.resignFirstResponder()
        return true
        
        
    }
    
    //fires when user is in textfield
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print ("textFieldShouldBegininEditing: ")
        return true
    }
    
    //fires when user types in a string
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersinRange: \(string)")
        
        if (string == "a"){
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else if (string == "e"){
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else if (string == "i"){
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else if (string == "o"){
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else if (string == "u"){
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else {
            self.view.backgroundColor = UIColor.yellowColor()
        }
        
        return true

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

