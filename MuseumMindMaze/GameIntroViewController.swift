//
//  GameIntroViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/12/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
import AVFoundation

class GameIntroViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Fmaj", ofType: "mp3")!))
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
        }
        catch {
            print(error)
        }
        
        
    }
}
