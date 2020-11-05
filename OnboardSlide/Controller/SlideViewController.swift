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
    var heightScroll: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCaption.append(contentsOf: ["Get the mission and let’s explore the space and search a partners to help you if have problem.", "Use board to help organize, track your every progress and making foot note for your mission."])
        arrayImage.append(contentsOf: ["Page1Onboard", "Page2Omboard"])
        scrollViewSetup()
    }

    //MARK: - Scroll View Swipe Setup
    func scrollViewSetup() {
        scrollSlider.showsHorizontalScrollIndicator = false
        scrollSlider.isPagingEnabled = true
        scrollSlider.delegate = self
        
        let sizeWidth = UIScreen.main.bounds.size.width-32 //to read width screen device and minus with total of leading and trailing constraints
        let sizeHeight = UIScreen.main.bounds.size.height //to read height screen device
        
        //set size scroll by read height screen device
        if sizeHeight < 836 {
            heightScroll = 400
        } else {
            heightScroll = 600
        }
        
        let pageCount = arrayCaption.count
        pageIndicator.numberOfPages = pageCount
        for index in 0..<pageCount {
            
            //Added imageView
            let imageView = UIImageView.init(image: UIImage.init(named: arrayImage[index]))
            imageView.frame = CGRect(x: sizeWidth * CGFloat(index), y: (heightScroll!/2)-24, width: sizeWidth, height: 140)
            imageView.contentMode = .scaleAspectFit
            self.scrollSlider.addSubview(imageView)
            
            //Added label text
            let framCaption = CGRect(x: sizeWidth * CGFloat(index), y: imageView.frame.maxY+16, width: sizeWidth, height: 96)
            let caption = UILabel.init(frame: framCaption)
            caption.numberOfLines = 0
            caption.textAlignment = .center
            caption.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
            caption.textColor = UIColor.white
            caption.text = arrayCaption[index]
            self.scrollSlider.addSubview(caption)
        }
        scrollSlider.contentSize = CGSize(width: sizeWidth * CGFloat(pageCount), height: heightScroll!)
    }
}

extension SlideViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x/scrollView.frame.size.width)
        pageIndicator.currentPage = page
        
        //read current page, when the last index button is show
        switch page {
        case arrayCaption.count-1:
            buttonStart.isHidden = false
        default:
            buttonStart.isHidden = true
        }
    }
}

