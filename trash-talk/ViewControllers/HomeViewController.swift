//
//  HomeViewController.swift
//  trash-talk
//
//  Created by Katrina Rodriguez on 4/17/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var numTapped: Int!
    var scoreLabel: UILabel!
    var trashTalk: UILabel!
    
    override func loadView() {
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.view = view
        
        //margins
        
        let originX = frame.size.width * 0.5
        
        //header
        let header = UILabel(frame: CGRect(x: originX-100, y: 20, width: 200, height: 44))
        header.text = "Trash Talk Generator"
        header.font = UIFont(name: "HiraginoSans-W3", size: 18)
        header.textColor = UIColor.darkGrayColor()
        header.textAlignment = .Center
        view.addSubview(header)
        
        //submit btn
        let submit = UIButton(type: .Custom)
        submit.frame = CGRect(x: originX-40, y: 300, width: 80, height: 44)
        submit.layer.borderWidth = 1
        submit.layer.borderColor = UIColor.lightGrayColor().CGColor
        submit.layer.cornerRadius = 5
        submit.setImage(UIImage(named:"btnImage.png"), forState: .Normal)
        view.addSubview(submit)
        submit.addTarget(self, action: #selector(HomeViewController.submitBtn(_:)), forControlEvents: .TouchUpInside)
        
        //trash talk score
        scoreLabel = UILabel(frame: CGRect(x: originX-100, y: 400, width: 200, height: 44))
        scoreLabel.textColor = UIColor.darkGrayColor()
        scoreLabel.font = UIFont(name: "HiraginoSans-W3", size: 16)
        view.addSubview(scoreLabel)
        
        //trash talk phrases
        trashTalk = UILabel(frame: CGRect(x: originX-100, y: 100, width: 200, height: 44))
        trashTalk.textColor = UIColor.darkGrayColor()
        view.addSubview(trashTalk)

        
        
    }
    
    //submit btn action
    func submitBtn(btn: UIButton){
        self.numTapped = self.numTapped+1
        print("submitted score count: \(self.numTapped)")
        self.scoreLabel.text = "Trash Talk Score: \(self.numTapped)"
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numTapped = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
