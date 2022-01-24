//
//  ViewController.swift
//  DatePicker
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var pickerTimeLabel: UILabel!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(
            timeInterval: interval,
            target: self,
            selector: timeSelector,
            userInfo: nil,
            repeats: true
        )
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        pickerTimeLabel.text = "선택 시간 : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        currentTimeLabel.text = "현재 시간 : " + formatter.string(from: date as Date)
    }
}

