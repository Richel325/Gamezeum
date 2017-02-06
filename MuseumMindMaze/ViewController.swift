//
//  ViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/30/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData { (objects:[ShortObject]?) in
            ()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

