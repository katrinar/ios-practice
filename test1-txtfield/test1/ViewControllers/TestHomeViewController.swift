//
//  TestHomeViewController.swift
//  test1
//
//  Created by Katrina Rodriguez on 4/16/16.
//  Copyright © 2016 Nooks&Grannies. All rights reserved.
//

import UIKit

class TestHomeViewController: TestViewController {
    
    var testImage: UIImageView!

    override func loadView() {
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.testImage = UIImageView(frame:CGRect(x: 120, y: 40, width: 100, height: 100))
        self.testImage.backgroundColor  = UIColor.greenColor()
        
        view.addSubview(self.testImage)
        
        let text = UITextField(frame: CGRect(x: 120, y: 200, width: 100, height: 44))
        text.backgroundColor = UIColor.blueColor()
        view.addSubview(text)
        
        
        self.view = view
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
