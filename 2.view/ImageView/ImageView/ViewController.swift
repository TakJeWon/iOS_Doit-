//
//  ViewController.swift
//  ImageView
//
//  Created by 탁제원 on 2022/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imageOn: UIImage?
    var imageOff: UIImage?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageOn = UIImage(named: "lamp_on.png")
        imageOff = UIImage(named: "lamp_off.png")
        
        imageView.image = imageOn
    }

    @IBAction func buttonResizeImage(_ sender: Any) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom){
            newWidth = imageView.frame.width/scale
            newHeight = imageView.frame.height/scale
            buttonResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imageView.frame.width*scale
            newHeight = imageView.frame.height*scale
            buttonResize.setTitle("축소", for: .normal)
        }
        
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        if sender.isOn {
            imageView.image = imageOn
        }else {
            imageView.image = imageOff
        }
    }
}

