//
//  ViewController.swift
//  Sketch
//
//  Created by 탁제원 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lineSizeTextField: UITextField!
    
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearImageView(_ sender: UIButton) {
        imageView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if lineSizeTextField.text != nil {
            
            lineSize = CGFloat(NSString(string: lineSizeTextField.text!).floatValue)
            UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        }
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imageView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imageView)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            imageView.image = nil
        }
    }
    @IBAction func changeToBlack
    (_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
    @IBAction func changeToRed(_ sender: Any) {
        lineColor = UIColor.red.cgColor
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
    @IBAction func changeToGreen(_ sender: Any) {
        lineColor = UIColor.green.cgColor
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
    @IBAction func changeToBlue(_ sender: Any) {
        lineColor = UIColor.blue.cgColor
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
}

