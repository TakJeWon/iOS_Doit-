//
//  ViewController.swift
//  WebViewAndHTML
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myFilePath = Bundle.main.path(forResource: "workFlowy", ofType: "html")
        let myURL = URL(fileURLWithPath: myFilePath!)
        let myRequest = URLRequest(url: myURL)
        myWebView.load(myRequest)
    }

}

