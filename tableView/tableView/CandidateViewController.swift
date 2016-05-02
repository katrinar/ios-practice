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
    var candidateName: UILabel!
    var stateParty: UILabel!
    var profGender: UILabel!
    var candidateBio: UILabel!
    var scroll: UIScrollView!
    
    
    override func loadView() {
        
        self.title = candidate.name.capitalizedString
        
        edgesForExtendedLayout = .None
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = (candidate.party == "democrat") ? .blueColor() : .redColor()
        self.view = view
        
        let scroll = UIScrollView(frame: frame)
        scroll.contentSize = CGSize(width: 0, height: 1000)
        view.addSubview(scroll)
        
        let originX = frame.width * 0.5
//        let originY = frame.height * 0.5
        
        self.profImage = UIImageView(frame: CGRect(x: originX - 100, y: 80, width: 200, height: 200))
        self.profImage.image = UIImage(named: candidate.image)
        scroll.addSubview(profImage)
        
        self.candidateName = UILabel(frame: CGRect(x: originX - 100, y: 300, width: 200, height: 44))
        self.candidateName.text = candidate.name.capitalizedString
        self.candidateName.textAlignment = .Center
        self.candidateName.textColor = UIColor.whiteColor()
        scroll.addSubview(candidateName)
        
        self.stateParty = UILabel(frame: CGRect(x: originX - 125, y: 350, width: 250, height: 44))
        stateParty.text = candidate.state.capitalizedString+", "+candidate.party.capitalizedString
        stateParty.textColor = UIColor.whiteColor()
        stateParty.textAlignment = .Center
        scroll.addSubview(stateParty)

        self.profGender = UILabel(frame: CGRect(x: originX - 50, y: 400, width: 100, height: 44))
        let agestr = String(candidate.age)
        self.profGender.text = candidate.gender.capitalizedString+", "+agestr
        self.profGender.textColor = UIColor.whiteColor()
        self.profGender.textAlignment = .Center
        scroll.addSubview(profGender)
        
        self.candidateBio = UILabel(frame: CGRect(x: originX - 150, y: 450, width: 300, height: 300))
        self.candidateBio.text = candidate.bio
        self.candidateBio.textColor = UIColor.whiteColor()
        self.candidateBio.textAlignment = .Center
        self.candidateBio.numberOfLines = 0
        self.candidateBio.lineBreakMode = .ByWordWrapping
        scroll.addSubview(candidateBio)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
