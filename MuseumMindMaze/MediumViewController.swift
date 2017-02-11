//
//  MediumViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/10/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class MediumViewController: UIViewController {
    
    @IBOutlet weak var artTitle: UILabel!
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artArtist: UILabel!
    @IBOutlet weak var artObjectDate: UILabel!
    @IBOutlet weak var artDescription: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var score: UILabel!
    
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        
        
    }
    
    
    var objects = [ArtObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
            self.objects = objects!
        })
    }
}
