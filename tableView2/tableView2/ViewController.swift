//
//  ViewController.swift
//  tableView2
//
//  Created by Katrina Rodriguez on 4/30/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var addBtn: UIButton!
    var text: UITextField!
    var taskArray: Array<String>!
    var task = ""
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        self.view = view
        view.backgroundColor = UIColor.whiteColor()
        
        let originX = frame.width * 0.5
        
        let addBtn = UIButton(type: .Custom)
        addBtn.frame = CGRect(x: originX + 50, y: 150, width: 50, height: 44)
        addBtn.layer.borderColor = UIColor.darkGrayColor().CGColor
        addBtn.layer.borderWidth = 1
        addBtn.layer.cornerRadius = 5
        addBtn.setTitle("add", forState: .Normal)
        view.addSubview(addBtn)
        addBtn.addTarget(self, action: #selector(ViewController.addTo(_:)), forControlEvents: .TouchUpInside)
        
        let text = UITextField(frame: CGRect(x: 20, y: 150, width: 160, height: 44))
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.darkGrayColor().CGColor
        text.layer.cornerRadius = 5
        text.text = ""
        view.addSubview(text)
        
        var task = text.text
        
        var taskArray = Array<String>()


    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    func addTo(btn: UIButton){
        var task = text.text
        taskArray.append(task! )
        print("addTo: \(self.taskArray)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

