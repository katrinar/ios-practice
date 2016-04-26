//
//  CandidateViewController.swift
//  tableView
//
//  Created by Katrina Rodriguez on 4/25/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class CandidateViewController: UIViewController {
    
    var candidate: Candidate!
    var profImage: UIImageView!
    var nameParty: UILabel!
    var profGender: UILabel!
    
    
    override func loadView() {
        self.title = candidate.name
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.yellowColor()
        self.view = view
        
        let originX = frame.width * 0.5
        self.profImage = UIImageView(frame: CGRect(x: originX * 0.5, y: 80, width: 200, height: 200))
        profImage.image = UIImage(named: candidate.image)
        view.addSubview(profImage)
        
        self.nameParty = UILabel(frame: CGRect(x: originX * 0.5, y: 300, width: 250, height: 44))
        nameParty.text = candidate.name.capitalizedString+", "+candidate.party.capitalizedString
        view.addSubview(nameParty)
        

        self.profGender = UILabel(frame: CGRect(x: originX * 0.5, y: 350, width: 200, height: 44))
        let agestr = String(candidate.age)
        profGender.text = candidate.gender.capitalizedString+", "+agestr
        view.addSubview(profGender)
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
