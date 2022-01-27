//
//  ViewController.swift
//  TapTouch
//
//  Created by 탁제원 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var tapCount: UILabel!
    @IBOutlet weak var touchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        message.text = "Touches Began"
        tapCount.text = String(touch.tapCount)
        touchCount.text = String(touches.count)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        message.text = "Touches Moved"
        tapCount.text = String(touch.tapCount)
        touchCount.text = String(touches.count)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        message.text = "Touches Ended"
        tapCount.text = String(touch.tapCount)
        touchCount.text = String(touches.count)
    }

}

