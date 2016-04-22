//
//  HomeViewController.swift
//  trash-talk
//
//  Created by Katrina Rodriguez on 4/17/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //variables
    var numTapped: Int!
    var scoreLabel: UILabel!
    var trashTalk: UILabel!
    var isEven = false
    var numFive = false
    var exitBtnTap = false
    let homeCtr = MainViewController()
    
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.view = view
        
        //margins
        
        let originX = frame.size.width * 0.5
        let originY = frame.size.height * 0.5
        
        //header
        let header = UILabel(frame: CGRect(x: originX-100, y: 20, width: 200, height: 44))
        header.text = "Trash Talk Generator"
        header.font = UIFont(name: "HiraginoSans-W3", size: 18)
        header.textColor = UIColor.darkGrayColor()
        header.textAlignment = .Center
        view.addSubview(header)
        
        //submit btn
        let submitBtn = UIButton(type: .Custom)
        submitBtn.frame = CGRect(x: originX-40, y: 300, width: 80, height: 44)
        submitBtn.layer.borderWidth = 1
        submitBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
        submitBtn.layer.cornerRadius = 5
        submitBtn.setImage(UIImage(named:"btnImage.png"), forState: .Normal)
        view.addSubview(submitBtn)
        submitBtn.addTarget(self, action: #selector(HomeViewController.submitBtnTap(_:)), forControlEvents: .TouchUpInside)
        
        //exit btn
        let exitBtn = UIButton(type: .Custom)
        exitBtn.frame = CGRect(x: originX+60, y: originY+150, width: 80, height: 44)
        exitBtn.layer.borderWidth = 1
        exitBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
        exitBtn.layer.cornerRadius = 5
        exitBtn.setImage(UIImage(named:  "btnExit.png"), forState: .Normal)
        exitBtn.addTarget(self, action: #selector(HomeViewController.exitBtnTap(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(exitBtn)
        
        //trash talk score
        scoreLabel = UILabel(frame: CGRect(x: originX-140, y: originY+150, width: 200, height: 44))
        scoreLabel.textColor = UIColor.darkGrayColor()
        scoreLabel.font = UIFont(name: "HiraginoSans-W3", size: 16)
        view.addSubview(scoreLabel)
        
        //trash talk phrases
        trashTalk = UILabel(frame: CGRect(x: originX-100, y: 100, width: 200, height: 44))
        trashTalk.textColor = UIColor.darkGrayColor()
        view.addSubview(trashTalk)
  
        
    }
    
    //submit btn action
    func submitBtnTap(btn: UIButton){
        self.exitBtnTap = true
        self.numTapped = self.numTapped+1
        print("submitted score count: \(self.numTapped)")
        self.scoreLabel.text = "Trash Talk Score: \(self.numTapped)"
        
        if (self.numTapped % 2 == 0) {
            self.isEven = true
            self.trashTalk.text = "Get your popcorn ready, because I'm gonna put on a show"
            self.trashTalk.numberOfLines = 0
            self.trashTalk.lineBreakMode = .ByWordWrapping
            }
        else if (self.numTapped % 5 == 0) {
            self.numFive = true
            self.trashTalk.text = "boom"
            }
        else {
            self.trashTalk.text = "That's a clown question, bro"
        }
        
        }
    //exit btn action
    func exitBtnTap(btn: UIButton){
        print("exit btn tap: ")
        self.exitBtnTap = false
        
        if (self.exitBtnTap == false) {
            self.navigationController?.pushViewController(homeCtr, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numTapped = 0
        
        self.trashTalk.font = UIFont(name: "HiraginoSans-W3", size: 12)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
