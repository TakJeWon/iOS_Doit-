//
//  ViewController.swift
//  PageControl
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        print(images.count)
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imageView.image = UIImage(named: images[0])
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }

    @IBAction func pageChnage(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    //pinch
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    //swipe
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                if pageControl.currentPage != 0 {
                    pageControl.currentPage -= 1
                    imageView.image = UIImage(named: images[pageControl.currentPage])
                }
            case UISwipeGestureRecognizer.Direction.left:
                if pageControl.currentPage != images.count-1 {
                    pageControl.currentPage += 1
                    imageView.image = UIImage(named: images[pageControl.currentPage])
                }
            default:
                break
            }
        }
    }
    
    
}

