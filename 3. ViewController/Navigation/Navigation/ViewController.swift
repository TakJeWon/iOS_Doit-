//
//  ViewController.swift
//  Navigation
//
//  Created by 탁제원 on 2022/01/25.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imageOn = UIImage(named: "lamp_on.png")
    let imageOff = UIImage(named: "lamp_off.png")
    var isOn = true
    var isZoom = false
    let scale:CGFloat = 2.0
    

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue: use button"
        } else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue: use Bar button"
        }
        
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.textMessgae = textField.text!
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textField.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imageView.image = imageOn
            self.isOn = true
        } else {
            imageView.image = imageOff
            self.isOn = false
        }
    }
    
    func didImageExpansionDone(_ controller: EditViewController, isZoom: Bool) {
        
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            newWidth = imageView.frame.width*scale
            newHeight = imageView.frame.height*scale
        } else {
            newWidth = imageView.frame.width/scale
            newHeight = imageView.frame.height/scale
        }
        
        self.isZoom = isZoom
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
}

