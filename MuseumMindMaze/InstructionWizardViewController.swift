//
//  InstructionWizardViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/30/18.
//  Copyright © 2018 Richel Cuyler. All rights reserved.
//

import UIKit

class InstructionWizardViewController: UIViewController {

    @IBOutlet weak var instruction1: UITextView!
    @IBOutlet weak var instruction2: UITextView!
    @IBOutlet weak var instruction3: UITextView!
    @IBOutlet weak var instruction4: UITextView!
    @IBOutlet weak var instruction5: UITextView!
    @IBOutlet weak var instructionImage: UIImageView!
    
    @IBOutlet weak var skip: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instruction2.isHidden = true
        instruction3.isHidden = true
        instruction4.isHidden = true
        instruction5.isHidden = true
        instructionImage.image = #imageLiteral(resourceName: "title_museum_bg")

       
    }


    

}
