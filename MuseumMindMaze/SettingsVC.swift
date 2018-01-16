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
    
    
    @IBOutlet weak var musicSwitch: UISwitch!
    
    
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UserDefaults.standard.music
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Fmaj", ofType: "mp3")!))
        }
        catch {
            print(error)
        }
        musicSwitch.addTarget(self, action: #selector(musicOnOff(_:)), for: UIControlEvents.valueChanged)
        
    }
    
    
    @IBAction func musicOnOff(_ sender: Any) {
        
        var myMusicSwitch : Bool = false // game starts with switch on so music feature is clear
        
        if musicSwitch.isOn == true { // when user turns or when it is turned on at game start, set the value to `true`
            myMusicSwitch = true
        }
        else { // else set the value to 'false'
            myMusicSwitch = false
        }
        
        // finally set the value to user default like this
        UserDefaults.standard.set(myMusicSwitch, forKey: "musicSwitch")
    }
    
    
    @IBAction func resetScore(_ sender: UIButton) {
        UserDefaults.standard.score = 0
    }
    
    
    @IBAction func dismissToGallery(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
