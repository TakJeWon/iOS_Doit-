//
//  ViewController.swift
//  Audio
//
//  Created by 탁제원 on 2022/01/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer?
    var audioFile: URL!
    let MAX_VOLUME: Float = 10.0
    var progressTimer: Timer!
    
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    
    @IBOutlet weak var playProgressView: UIProgressView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        initPlay()
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
        
        volumeSlider.maximumValue = MAX_VOLUME
        volumeSlider.value = 1.0
        playProgressView.progress = 0
        
        audioPlayer?.delegate = self
        audioPlayer?.prepareToPlay()
        audioPlayer?.volume = volumeSlider.value
        
        endTimeLabel.text = convertNSTimeIntervalToString(audioPlayer!.duration)
        currentTimeLabel.text = convertNSTimeIntervalToString(0)
        
        setPlayButton(true, pause: false, stop: false)
    }
    
    func convertNSTimeIntervalToString(_ time: TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    func setPlayButton(_ play: Bool, pause: Bool, stop: Bool){
        playButton.isEnabled = play
        pauseButton.isEnabled = pause
        stopButton.isEnabled = stop
    }
    
    @objc func updatePlayTime(){
        currentTimeLabel.text = convertNSTimeIntervalToString(audioPlayer!.currentTime)
        playProgressView.progress = Float(audioPlayer!.currentTime/audioPlayer!.duration)
    }

    @IBAction func playAudio(_ sender: UIButton) {
        audioPlayer?.play()
        setPlayButton(false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func pasueAudio(_ sender: UIButton) {
        audioPlayer?.pause()
        setPlayButton(true, pause: false, stop: true)
    }
    
    @IBAction func stopAudio(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
        setPlayButton(true, pause: false, stop: false)
        currentTimeLabel.text = convertNSTimeIntervalToString(0)
        playProgressView.progress = 0
    }
    
    @IBAction func changeVolume(_ sender: UISlider) {
        audioPlayer!.volume = volumeSlider.value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButton(true, pause: false, stop: false)
    }
}

