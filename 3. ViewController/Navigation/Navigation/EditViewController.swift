//
//  EditViewController.swift
//  Navigation
//
//  Created by 탁제원 on 2022/01/25.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageExpansionDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchIsOn: UISwitch!
    @IBOutlet weak var switchExpansion: UISwitch!
    
    var textWayValue: String = ""
    var textMessgae: String = ""
    var delegate: EditDelegate?
    
    var isOn = false
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = textWayValue
        textField.text = textMessgae
        switchIsOn.isOn = isOn
        switchExpansion.isOn = isZoom
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: textField.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageExpansionDone(self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func switchImage(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func switchExpansion(_ sender: UISwitch) {
        if sender.isOn {
            isZoom = true
        } else {
            isZoom = false
        }
    }
}
