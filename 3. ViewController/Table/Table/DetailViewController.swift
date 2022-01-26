//
//  DetailViewController.swift
//  Table
//
//  Created by 탁제원 on 2022/01/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""

    @IBOutlet weak var itemLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemLabel.text = receiveItem
    }
    
    func receiveItem(_ item: String){
        receiveItem = item
    }

}
