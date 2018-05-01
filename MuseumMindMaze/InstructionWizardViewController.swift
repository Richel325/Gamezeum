//
//  InstructionWizardViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/30/18.
//  Copyright © 2018 Richel Cuyler. All rights reserved.
//

import UIKit

class InstructionWizardViewController: UIViewController {

    @IBOutlet weak var instructionImage: UIImageView!
    @IBOutlet weak var skip: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        instructionImage.image = #imageLiteral(resourceName: "title_museum_bg")

       
    }


    

}
