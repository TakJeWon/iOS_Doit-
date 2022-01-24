//
//  ViewController.swift
//  ImageViewer
//
//  Created by 탁제원 on 2022/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageNumber = 1
    let maxImageNumber = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageName = String(imageNumber) + ".png"
        imageView.image = UIImage(named: imageName)
    }

    @IBAction func backwardButtonPressed(_ sender: Any) {
        if (imageNumber == 1){
            imageNumber = maxImageNumber
        } else {
            imageNumber -= 1
        }
        
        let imageName = String(imageNumber) + ".png"
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        if (imageNumber == maxImageNumber){
            print(imageNumber)
            imageNumber = 1
        } else {
            imageNumber += 1
        }
        
        let imageName = String(imageNumber) + ".png"
        imageView.image = UIImage(named: imageName)
    }
    
}

