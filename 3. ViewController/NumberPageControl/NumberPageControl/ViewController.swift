//
//  ViewController.swift
//  NumberPageControl
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = numbers.count
        pageControl.currentPage = 0
        numberLabel.text = numbers[0]
        
    }

    @IBAction func changeNumber(_ sender: UIPageControl) {
        
        numberLabel.text = numbers[pageControl.currentPage]
    }
    
}

