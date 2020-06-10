//
//  ViewController.swift
//  playerVideo
//
//  Created by Nguyen Manh Quynh on 12/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit // for play video

class ViewController: UIViewController {
    
    //MARK :- Outlet
    @IBOutlet weak var audioTime: UILabel!
    @IBOutlet weak var nowTime: UILabel!
    @IBOutlet weak var sliderBar: UISlider!
    
    //MARK :- Variables
    var player : AVAudioPlayer!
    var timePlay :Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderBar.value = 0.0
        guard let path = Bundle.main.path(forResource: "happyNewYear", ofType: "mp3") else{ return}
        guard let audioURL = URL(string: path) else{ return}
        do {
            player = try AVAudioPlayer(contentsOf: audioURL)
            nowTime.text = "0:00"
            audioTime.text = stringFromTimeInterval(interval: player.duration) as String
            sliderBar.maximumValue = Float(player.duration)
            sliderBar.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
            
            player.prepareToPlay()
        } catch let err{ print(err.localizedDescription )}
        print("Link: ", path)
    }
    
    //MARK :- Private Function
    func stringFromTimeInterval(interval: TimeInterval) -> NSString {
        
        let ti = NSInteger(interval)
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        return NSString(format: "%0.2d:%0.2d",minutes,seconds)
    }
    
    
    //MARK :- Handle Action
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            
            switch touchEvent.phase {
            case .began: break
            case .moved:
                let timenow = Double(sliderBar.value)
                nowTime.text = stringFromTimeInterval(interval: timenow) as String
                player.currentTime = timenow
                
                
            case .ended: break;
                
            default:
                break
            }
        }
    }
    
    @IBAction func play(_ sender: Any) {
        
        //player.play(atTime: Double(sliderBar.value))
        
        player.play()
        timePlay  = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.sliderBar.value += 1
            self.nowTime.text = self.stringFromTimeInterval(interval: Double(self.sliderBar.value)) as String
        })
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timePlay?.invalidate()
    }
    
    @IBAction func stop(_ sender: Any) {
        
        timePlay?.invalidate()
        sliderBar.value = 0
        nowTime.text = "0:00"
        player.stop()
        player.currentTime = 0
        
        
    }
}
