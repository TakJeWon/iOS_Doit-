//
//  ViewController.swift
//  PinchImageView
//
//  Created by 탁제원 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        imagePinch.transform = imagePinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }

}

