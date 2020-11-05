//
//  ViewController.swift
//  OnboardSlide
//
//  Created by Maul on 05/11/20.
//

import UIKit

class SlideViewController: UIViewController {
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var scrollSlider: UIScrollView!
    @IBOutlet weak var buttonStart: UIButton!
    
    var arrayCaption: [String] = []
    var arrayImage: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCaption = ["Get the mission and let’s explore the space and search a partners to help you if have problem", "Use board to help organize, track your every progress and making foot note for your mission"]
        arrayImage = ["Page1Onboard, Page2Onboard"]
    }


}

