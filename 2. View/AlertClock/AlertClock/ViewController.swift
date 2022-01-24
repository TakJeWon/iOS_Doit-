//
//  ViewController.swift
//  AlertClock
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    var currentTime = ""
    var pickerTime = ""
    var alarmFlag = false

    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var pickerTimeLabel: UILabel!
    
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        currentTime = formatter.string(from: sender.date)
        pickerTimeLabel.text = "선택 시간 : " + currentTime
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        pickerTime = formatter.string(from: date as Date)
        currentTimeLabel.text = "현재 시간 : " + pickerTime
        
        if (currentTime == pickerTime){
            if !alarmFlag{
                let alert = UIAlertController(
                    title: "알림",
                    message: "설정된 시간입니다!!!",
                    preferredStyle: UIAlertController.Style.alert
                )
                
                let action = UIAlertAction(
                    title: "네, 알겠습니다.",
                    style: UIAlertAction.Style.default,
                    handler: nil
                )
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                alarmFlag = true
            }
        } else {
            alarmFlag = false
        }
    }
    
}

