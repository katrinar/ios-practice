//
//  VenueViewController.swift
//  eats
//
//  Created by Katrina Rodriguez on 5/10/16.
//  Copyright © 2016 kat-co. All rights reserved.
//

import UIKit

class VenueViewController: UIViewController {
    
    var venueRating: UILabel!
    var selectedVenue: FoodPlace!
    var venueVicinity: UILabel!
    var venueIcon: UIImageView!
//    var ratingText: ""
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        edgesForExtendedLayout = .None
        self.view = view
        view.backgroundColor = UIColor.whiteColor()
        
        self.title = selectedVenue.name
        
        self.venueRating = UILabel(frame: CGRect(x: 20, y: 20, width: 400, height: 44))
        self.venueRating.textColor = UIColor.blackColor()
        self.venueRating.backgroundColor = UIColor.yellowColor()

        view.addSubview(venueRating)
        
        self.venueVicinity = UILabel(frame: CGRect(x: 20, y: 60, width: 300, height: 44))
        self.venueVicinity.textColor = UIColor.blackColor()
        self.venueVicinity.text = selectedVenue.vicinity
        view.addSubview(venueVicinity)
        
        self.venueIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.venueIcon.center = CGPoint(x: 0.5*frame.size.width, y: 180)
//        self.venueIcon.backgroundColor = UIColor.greenColor()
        self.venueIcon.image = UIImage(named: selectedVenue.icon)
        view.addSubview(venueIcon)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   }
