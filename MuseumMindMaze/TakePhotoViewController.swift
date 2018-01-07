//
//  TakePhotoViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 12/8/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class TakePhotoViewController: UIViewController {

    @IBOutlet weak var paintingTitleLabel: UILabel!
    @IBOutlet weak var paintingImageView: UIImageView!
    @IBOutlet weak var paintingArtistLabel: UILabel!
    @IBOutlet weak var cameraButton: UIButton!
    

    //question answered for camera shutter sound: 1108
    
    
    var object: ArtObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(onViewOnly: true) { (_: [ArtObject]?) in
        }
        
        //self.answer.delegate = self

   }
    
    
    
    @IBAction func lookupOnlineReference(_ sender: Any) {
    }
    
    @IBAction func presentFullScreenPaintingVC(_ sender: Any) {
    }
    

}
