//
//  Instruction5ViewController.swift
//  Gamezeum
//
//  Created by Richel Cuyler on 5/1/18.
//  Copyright © 2018 Richel Cuyler. All rights reserved.
//

import UIKit

class Instruction5ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        func checkReachability(sender: UIButton) {
            if currentReachabilityStatus == .reachableViaWiFi || currentReachabilityStatus == .reachableViaWWAN {
                //proceed as usual to tableview of art objects
            } else {
                let alertController1 = UIAlertController(title: "No internet connection!", message:
                    "Please make sure you are connected to the internet, and try again.", preferredStyle: UIAlertControllerStyle.alert)
                alertController1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController1, animated: true, completion: nil)        }
        }
    }

}
