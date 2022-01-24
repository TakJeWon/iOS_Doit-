//
//  ViewController.swift
//  Tab
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func moveToDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

