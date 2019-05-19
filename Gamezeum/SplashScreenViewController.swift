//
//  SplashScreenViewController.swift
//  Gamezeum
//
//  Created by Richel Cuyler on 3/6/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
import Foundation

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var objectImage: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var loading_4: UIImage!
    var loading_5: UIImage!
    var loading_6: UIImage!
    var loading_7: UIImage!
    var loading_8: UIImage!
    var loading_9: UIImage!
    var loading_10: UIImage!
    var loading_11: UIImage!
    var loading_12: UIImage!
    var loading_13: UIImage!
    var loading_14: UIImage!
    var loading_15: UIImage!
    var loading_16: UIImage!
    var loading_17: UIImage!
    var loading_18: UIImage!
    var loading_19: UIImage!
    var loading_20: UIImage!
    var loading_21: UIImage!
    var loading_22: UIImage!
    var loading_23: UIImage!
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {//TODO: Add pictures and animations for Brooklyn Museum logo (per link sent to John)
        super.viewDidLoad()
        loading_1 = UIImage(named: "loading_0000_01")!//should run after 23 in a loop
        loading_2 = UIImage(named: "loading_0001_02")!
        loading_3 = UIImage(named: "loading_0002_03")!
        loading_4 = UIImage(named: "loading_0003_04")!
        loading_5 = UIImage(named: "loading_0004_05")!
        loading_6 = UIImage(named: "loading_0005_06")!
        loading_7 = UIImage(named: "loading_0006_07")!
        loading_8 = UIImage(named: "loading_0007_08")!
        loading_9 = UIImage(named: "loading_0008_09")!
        loading_10 = UIImage(named: "loading_0009_10")!
        loading_11 = UIImage(named: "loading_0010_11")!
        loading_12 = UIImage(named: "loading_0011_12")!
        loading_13 = UIImage(named: "loading_0012_13")!
        loading_14 = UIImage(named: "loading_0013_14")!
        loading_15 = UIImage(named: "loading_0014_15")!
        loading_16 = UIImage(named: "loading_0015_16")!
        loading_17 = UIImage(named: "loading_0016_17")!
        loading_18 = UIImage(named: "loading_0017_18")!
        loading_19 = UIImage(named: "loading_0018_19")!
        loading_20 = UIImage(named: "loading_0019_20")!
        loading_21 = UIImage(named: "loading_0020_21")!
        loading_22 = UIImage(named: "loading_0021_22")!
        loading_23 = UIImage(named: "loading_0022_23")!//should run with 01
        
        images = [loading_1, loading_1,loading_1,loading_1,loading_1,loading_1, loading_1,loading_1,loading_1,loading_1,loading_1, loading_1,loading_1,loading_1,loading_1, loading_2,loading_2,loading_2, loading_3,loading_3,loading_3, loading_4,loading_4,loading_4, loading_5,loading_5,loading_5, loading_6,loading_6,loading_6, loading_7,loading_7,loading_7, loading_8,loading_8,loading_8, loading_9, loading_9, loading_9, loading_9, loading_9,loading_9, loading_9, loading_9, loading_9, loading_9,loading_9, loading_9, loading_9, loading_9, loading_9, loading_10,loading_10,loading_10, loading_11,loading_11,loading_11, loading_12, loading_12, loading_12, loading_13, loading_13, loading_13, loading_14, loading_14, loading_14, loading_15,loading_15,loading_15, loading_16,loading_16,loading_16, loading_17, loading_17, loading_17, loading_17, loading_17,loading_17, loading_17, loading_17, loading_17, loading_17,loading_17, loading_17, loading_17, loading_17, loading_17, loading_18, loading_18, loading_18, loading_19, loading_19,loading_19,loading_20,loading_20,loading_20, loading_21,loading_21,loading_21, loading_22,loading_22,loading_22, loading_23, loading_23, loading_23]
        animatedImage = UIImage.animatedImage(with: images, duration: 1.80)
        objectImage.image = animatedImage
        
        perform(#selector(SplashScreenViewController.showSplashScreenVC), with: nil, afterDelay: 5)
    }
    
    func showSplashScreenVC() {
        performSegue(withIdentifier: "appHomeScreen", sender: self)
    }
    
}

