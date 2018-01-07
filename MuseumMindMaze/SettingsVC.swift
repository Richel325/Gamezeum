//
//  SettingsVC.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 12/20/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
import AVFoundation

class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var soundsSwitch: UISwitch!
    
    @IBOutlet weak var musicSwitch: UISwitch!
    
    
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaults.standard.s
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Fmaj", ofType: "mp3")!))
        }
        catch {
            print(error)
        }
        
        
    }
    
    
    @IBAction func soundOnOff(_ sender: Any) {
        
    }
    
    @IBAction func musicOnOff(_ sender: Any) {
        if musicSwitch.isOn {
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
        } else {
            audioPlayer.stop()
        }
    }
    
    
    @IBAction func resetScore(_ sender: UIButton) {
        UserDefaults.standard.score = 0
    }
    
    
    @IBAction func dismissToGallery(_ sender: Any) {
    }
    
}
