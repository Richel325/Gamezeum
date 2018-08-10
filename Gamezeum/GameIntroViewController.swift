//
//  GameIntroViewController.swift
//  Gamezeum
//
//  Created by Richel Cuyler on 2/12/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
import AVFoundation


class GameIntroViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var backgroundImageView: UIView!
    @IBOutlet weak var startButtonView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var backgroundViewTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.alpha = 0
        startButtonView.alpha = 0
        logoView.alpha = 0
        
      
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Fugue#1_RichelCuyler_2005", ofType: "mp3")!))
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
        }
        catch {
            print(error)
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {
            self.backgroundImageView.alpha = 0.5
        }) { (true) in
            showLogo()
            
        }
        
        func showLogo(){
            UIView.animate(withDuration: 1, animations: {
                self.logoView.alpha = 1
            }) { (true) in
                showStartButton()
            }
            
        func showStartButton(){
            UIView.animate(withDuration: 1, animations: {
                self.startButtonView.alpha = 1
            })
                
            }
        }
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


