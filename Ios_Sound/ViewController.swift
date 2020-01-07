//
//  ViewController.swift
//  Ios_Sound
//
//  Created by MacStudent on 2020-01-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    
    var player = AVAudioPlayer()
    
    let path=Bundle.main.path(forResource: "ck", ofType: "mp3")
    
    
    var timer = Timer()
    
    

    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var trackSeek: UISlider!
    
    @IBAction func stopBtn(_ sender: UIButton) {
        player.stop()
    }

   
    @IBAction func pauseBtn(_ sender: UIBarButtonItem) {
        player.pause()
    }
    @objc func updateScrubber()
    {
      trackSeek.value=Float(player.currentTime)
    }
    
    @IBAction func playBtn(_ sender: UIBarButtonItem) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
            #selector(updateScrubber), userInfo: nil, repeats: true)
    }
    
    
    
    @IBAction func changeVolume(_ sender: UISlider) {
        player.volume=volumeSlider.value
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            player = try AVAudioPlayer(contentsOf:URL(fileURLWithPath: path!))
        }
        catch{
            print(error)
        }
        
        }


}

