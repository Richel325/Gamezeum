//
//  ObjectDetailsViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 12/7/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class ObjectDetailsViewController: UIViewController {

        @IBOutlet weak var paintingTitleLabel: UILabel!
        @IBOutlet weak var paintingImageView: UIImageView!
        @IBOutlet weak var paintingArtistLabel: UILabel!
        @IBOutlet weak var paintingDateLabel: UILabel!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        
        @IBAction func dismissToGallery(_ sender: Any) {
        }
        
        
        @IBAction func lookupOnlineReference(_ sender: Any) {
        }
        
        @IBAction func presentFullScreenPaintingVC(_ sender: Any) {
        }
        
        @IBAction func swipeToNextPainting(_ sender: Any) {
        }
        
        @IBAction func swipeToPreviousPainting(_ sender: Any) {
        }
}
