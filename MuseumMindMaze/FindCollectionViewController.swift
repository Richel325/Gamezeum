//
//  FindCollectionViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/10/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class FindCollectionViewController: UIViewController {
    
    @IBOutlet weak var artTitle: UILabel!
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artArtist: UILabel!
    @IBOutlet weak var artObjectDate: UILabel!
    @IBOutlet weak var artMedium: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        if answer == answer {// ALERT MESSAGES: For right and wrong answers
            let alertController2 = UIAlertController(title: "Correct Answer!", message:
                "You got it right! Click OK to keep playing.", preferredStyle: UIAlertControllerStyle.alert)
            alertController2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController2, animated: true, completion: nil)
            //Dismisses the segue when the answer is correct
            self.dismiss(animated: true, completion: nil)
        } else {
            let alertController1 = UIAlertController(title: "Wrong Answer!", message:
                "Please try answering the question again.", preferredStyle: UIAlertControllerStyle.alert)
            alertController1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController1, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    var objects = [ArtObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
            self.objects = objects!
        })
    }
}
