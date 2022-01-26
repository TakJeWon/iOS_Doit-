//
//  ViewController.swift
//  VideoPlayerForSeveralFormat
//
//  Created by 탁제원 on 2022/01/26.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playInternalMP4(_ sender: UIButton) {
        let url = makeURLByFormat(videoName: "FastTyping", format: "mp4")
        playVideo(url: url)
    }
    
    @IBAction func playInternalMOV(_ sender: UIButton) {
        let url = makeURLByFormat(videoName: "Mountaineering", format: "mov")
        playVideo(url: url)
    }
    
    @IBAction func playExternalMP4(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playVideo(url: url)
    }
    
    @IBAction func playExternalMOV(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")!
        playVideo(url: url)
    }
    
    func makeURLByFormat(videoName: String, format: String) -> NSURL{
        let filePath: String? = Bundle.main.path(forResource: videoName, ofType: format)
        let url = NSURL(fileURLWithPath: filePath!)
        return url
    }
    
    func playVideo(url: NSURL){
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        
        playerController.player = player
        
        self.present(playerController, animated: true){
            player.play()
        }
    }
}

