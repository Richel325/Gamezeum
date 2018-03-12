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
    
    @IBOutlet weak var backgroundImageView: UIView!
    @IBOutlet weak var startButtonView: UIView!
    @IBOutlet weak var logoView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.alpha = 0
        startButtonView.alpha = 0
        logoView.alpha = 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(musicOnOffSwitchToggled),
                                               name: NSNotification.Name("musicOnOffSwitchToggled"),
                                               object: nil)
        
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
            
            
            
            
            @objc func musicOnOffSwitchToggled () {
                var myMusicSwitch : Bool = true // game starts with switch on so music feature is clear
                
                if myMusicSwitch == true { // when user turns or when it is turned on at game start, set the value to `true`
                    myMusicSwitch = true
                }
                else { // else set the value to 'false'
                    myMusicSwitch = false
                }
            }
            
            
            
}



//        func toggleDashboard() {
//            if dashboardExpanded {
//                dashboardExpanded = false
//                positionConstraint.constant = -195
//            } else {
//                dashboardExpanded = true
//                positionConstraint.constant = 0
//            }
//            UIView.animate(withDuration: 0.3) {
//                self.view.layoutIfNeeded()
//            }
//        }
