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
        timer.invalidate()
        player.currentTime=0

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
    
    
    @IBAction func seekSlider(_ sender: UISlider) {
        player.currentTime = TimeInterval(trackSeek.value)
        player.play()
        
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake
        {
            let soundArray = ["ck","explosion","dk","bach"]
            let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            
            let fileLocation = Bundle.main.path(forResource: soundArray[randomNumber], ofType: "mp3")
            do{
                     player = try AVAudioPlayer(contentsOf:URL(fileURLWithPath: fileLocation!))
                    // trackSeek.maximumValue=Float(player.duration)
                player.play()
            }
                 catch{
                     print(error)
                 }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        do{
//            player = try AVAudioPlayer(contentsOf:URL(fileURLWithPath: path!))
//            trackSeek.maximumValue=Float(player.duration)
//        }
//        catch{
//            print(error)
//        }
        
        }


}

