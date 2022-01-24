//
//  ViewController.swift
//  WebView
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("http://www.naver.com")
    }
    
    func loadWebPage(_ url: String) {
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkURL(_ url: String) -> String {
        var strURL = url
        let flag = strURL.hasPrefix("http://")
        if !flag{
            strURL = "http://" + strURL
        }
        return strURL

    }

    @IBAction func goToURL(_ sender: UIButton) {
        let myURL = checkURL(urlTextField.text!)
        urlTextField.text = ""
        loadWebPage(myURL)
    }
    
    @IBAction func goToSite1(_ sender: UIButton) {
        loadWebPage("http://facebook.com")
    }
    @IBAction func goToSite2(_ sender: UIButton) {
        loadWebPage("http://google.com")
    }
    @IBAction func loadHTMLString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http://www.naver.com\">naver</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func loadHTMLFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func stop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func reload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func goForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

