//
//  GameIntroViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/12/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit


class GameIntroViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
