//
//  AddViewController.swift
//  Table
//
//  Created by 탁제원 on 2022/01/25.
//

import UIKit

class AddViewController: UIViewController {
    
    var imageArray = [UIImage?]()
    var selectedRow = 0

    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for i in 0..<itemsImageFile.count{
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image)
        }
        imageView.image = imageArray[0]
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        items.append(addTextField.text!)
        itemsImageFile.append(itemsImageFile[selectedRow])
        addTextField.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
}

extension AddViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = imageArray[row]
        selectedRow = row
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return imageView
    }
    
}
