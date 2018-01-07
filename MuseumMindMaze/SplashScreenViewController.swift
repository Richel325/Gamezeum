//
//  SplashScreenViewController.swift
//  MuseumMindMaze
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
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {//TODO: Add pictures and animations for Brooklyn Museum logo (per link sent to John)
        super.viewDidLoad()
//        loading_1 = UIImage(named: "mona-lisa")!
//        loading_2 = UIImage(named: "van-gogh")!
//        loading_3 = UIImage(named: "statue")!
//        loading_4 = UIImage(named: "museum-map")!
//        loading_5 = UIImage(named: "Icon-App-60x60")!
//        images = [loading_1, loading_2, loading_3, loading_4, loading_5]
//        animatedImage = UIImage.animatedImage(with: images, duration: 1.33)
//        objectImage.image = animatedImage
        
        perform(#selector(SplashScreenViewController.showSplashScreenVC), with: nil, afterDelay: 1)
    }
    
    func showSplashScreenVC() {
        performSegue(withIdentifier: "appHomeScreen", sender: self)
    }
    
}
