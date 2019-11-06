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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func resetScore(_ sender: UIButton) {
        UserDefaults.standard.score = 0
    }
    
    
    @IBAction func dismissToGallery(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
