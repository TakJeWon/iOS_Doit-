//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 탁제원 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {
    let numberOfTouchs = 2

    @IBOutlet weak var imageViewUp: UIImageView!
    @IBOutlet weak var imageViewDown: UIImageView!
    @IBOutlet weak var imageViewLeft: UIImageView!
    @IBOutlet weak var imageViewRight: UIImageView!
    
    var upImages = [UIImage]()
    var leftImages = [UIImage]()
    var downImages = [UIImage]()
    var rightImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upImages.append(UIImage(named: "arrow-up-black.png")!)
        upImages.append(UIImage(named: "arrow-up-red.png")!)
        upImages.append(UIImage(named: "arrow-up-green.png")!)
        
        downImages.append(UIImage(named: "arrow-down-black.png")!)
        downImages.append(UIImage(named: "arrow-down-red.png")!)
        downImages.append(UIImage(named: "arrow-down-green.png")!)
        
        leftImages.append(UIImage(named: "arrow-left-black.png")!)
        leftImages.append(UIImage(named: "arrow-left-red.png")!)
        leftImages.append(UIImage(named: "arrow-left-green.png")!)
        
        rightImages.append(UIImage(named: "arrow-right-black.png")!)
        rightImages.append(UIImage(named: "arrow-right-red.png")!)
        rightImages.append(UIImage(named: "arrow-right-green.png")!)
        
        imageViewUp.image = upImages[0]
        imageViewDown.image = downImages[0]
        imageViewLeft.image = leftImages[0]
        imageViewRight.image = rightImages[0]
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeRightMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
    }
    
    //한 손가락 스와이프 제스처를 행했을 때 실행할 액션 매서드
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imageViewUp.image = upImages[0]
            imageViewDown.image = downImages[0]
            imageViewLeft.image = leftImages[0]
            imageViewRight.image = rightImages[0]
        
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                print("up!")
                imageViewUp.image = upImages[1]
            case UISwipeGestureRecognizer.Direction.left:
                imageViewLeft.image = leftImages[1]
            case UISwipeGestureRecognizer.Direction.down:
                imageViewDown.image = downImages[1]
            case UISwipeGestureRecognizer.Direction.right:
                imageViewRight.image = rightImages[1]
            default:
                break
            }
        }
        
    }
    
    //두 손가락 스와이프 제스처를 행했을 때 실행할 액션 매서드
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imageViewUp.image = upImages[0]
            imageViewDown.image = downImages[0]
            imageViewLeft.image = leftImages[0]
            imageViewRight.image = rightImages[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imageViewUp.image = upImages[2]
            case UISwipeGestureRecognizer.Direction.down:
                imageViewDown.image = downImages[2]
            case UISwipeGestureRecognizer.Direction.left:
                imageViewLeft.image = leftImages[2]
            case UISwipeGestureRecognizer.Direction.right:
                imageViewRight.image = rightImages[2]
            default:
                break
            }
        }
    }


}

