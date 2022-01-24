//
//  ViewController.swift
//  Alert
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    let imageON = UIImage(named: "lamp-on.png")
    let imageOFF = UIImage(named: "lamp-off.png")
    let imageREMOVE = UIImage(named: "lamp-remove.png")
    var isLampOn = true

    @IBOutlet weak var lampImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImage.image = imageON
    }

    @IBAction func lampOnButton(_ sender: UIButton) {
        if isLampOn == true{
            let lampOnAlert = UIAlertController(
                title: "경고",
                message: "현재 On 상태입니다.",
                preferredStyle: UIAlertController.Style.alert
            )
            let onAction = UIAlertAction(
                title: "네, 알겠습니다",
                style: UIAlertAction.Style.default,
                handler: nil
            )
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            lampImage.image = imageON
            isLampOn = true
        }
    }
    
    @IBAction func lampOffButton(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(
                title: "램프 끄기",
                message: "램프를 끄시겠습니까?",
                preferredStyle: UIAlertController.Style.alert
            )
            let offAction = UIAlertAction(
                title: "네",
                style: UIAlertAction.Style.default,
                handler: { ACTION in
                    self.lampImage.image = self.imageOFF
                    self.isLampOn = false
            })
            
            let cancelAction = UIAlertAction(
                title: "아니오",
                style: UIAlertAction.Style.default,
                handler: nil
            )
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func lampRemoveButton(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(
            title: "램프 제거",
            message: "램프를 제거하시겠습니까?",
            preferredStyle: UIAlertController.Style.alert
        )
        
        let offAction = UIAlertAction(
            title: "아니오, 끕니다(off).",
            style: UIAlertAction.Style.default,
            handler: { ACTION in
                self.lampImage.image = self.imageOFF
                self.isLampOn = false
            })
        
        let onAction = UIAlertAction(
            title: "아니오, 켭니다(on)",
            style: UIAlertAction.Style.default) { ACTION in
                self.lampImage.image = self.imageON
                self.isLampOn = true
            }
        
        let removeAction = UIAlertAction(
            title: "네, 제거합니다",
            style: UIAlertAction.Style.destructive,
            handler: { ACTION in
                self.lampImage.image = self.imageREMOVE
                self.isLampOn = false
            })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

