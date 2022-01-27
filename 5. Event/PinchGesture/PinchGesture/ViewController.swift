//
//  ViewController.swift
//  PinchGesture
//
//  Created by 탁제원 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textPinch: UILabel!
    
    var initialFontSize: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        if (pinch.state == UIGestureRecognizer.State.began){
            initialFontSize = textPinch.font.pointSize
        } else {
            textPinch.font = textPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }


}

