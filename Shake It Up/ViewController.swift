//
//  ViewController.swift
//  Shake It Up
//
//  Created by Adrien Maranville on 3/14/17.
//  Copyright © 2017 Adrien Maranville. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            
            let soundArray = ["bass_bump", "snare_hit", "whistle", "fast_beat", "plucking"]
            let randomNum = Int(arc4random_uniform(UInt32(soundArray.count)))
            
            let audioPath = Bundle.main.path(forResource: soundArray[randomNum], ofType: "wav")
            
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                player.play()
            }
            catch {
                
            }

            
        }
    }

}

