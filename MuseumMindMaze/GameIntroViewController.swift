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
    
    @IBAction func resetScore(_ sender: UIButton) {
        UserDefaults.standard.score = 0
    }
    
    
    @IBAction func checkAction(_ sender: Any) {
        checkReachability()
    }
    
    
    
    func checkReachability() {
        if currentReachabilityStatus == .reachableViaWiFi || currentReachabilityStatus == .reachableViaWWAN {
            //proceed as usual to tableview of art objects
        } else {
            let alertController1 = UIAlertController(title: "No internet connection!", message:
                "Please make sure you are connected to the internet, and try again.", preferredStyle: UIAlertControllerStyle.alert)
            alertController1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController1, animated: true, completion: nil)        }
    }
    
}
