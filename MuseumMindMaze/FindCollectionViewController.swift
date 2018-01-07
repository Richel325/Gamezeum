//
//  FindCollectionViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/10/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class FindCollectionViewController: UIViewController {
    
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    
    
    
    
    
    
    
    var object: ArtObject?
    
    
    //Collection Array for Button Answers
    let collectionArray = ["American Art", "Arts of Africa", "Arts of the Americas", "Arts of the Islamic World", "Arts of the Pacific Islands", "Asian Art", "Contemporary Art", "Decorative Arts", "Egyptian, Classical, Ancient Near Eastern Art", "Elizabeth A. Sackler Center for Feminist Art", "European Art", "Libraries and Archives"]
    
   
    
    //Begin viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.answer.delegate = self
        
        if let artObjectImageURLString = object?.primaryImageURLString {
            artImage.downLoadImage(from: artObjectImageURLString)
            scoreLabel.text? = String(UserDefaults.standard.score)
            APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
                self.object = self.object
            })
        }
    }
    
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        if let userInput =
            
        answer1.currentTitle?.lowercased(), let actualAnswer = object?.collection?.name?.lowercased() {
            if actualAnswer.contains(userInput) {// ALERT MESSAGES: For right and wrong answers
                AudioServicesPlayAlertSound(1325)
                UserDefaults.standard.score += 10
                //Dismisses the segue when the answer is correct
                scoreLabel.text? = String(UserDefaults.standard.score)
                let alertController2 = UIAlertController(title: "Correct Answer!", message:
                    "You got it right! Click OK to keep playing.", preferredStyle: UIAlertControllerStyle.alert)
                alertController2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alertAction: UIAlertAction) in
                    let _ = self.navigationController?.popViewController(animated: true)}))
                self.present(alertController2, animated: true, completion: nil)
            } else {
                AudioServicesPlayAlertSound(1024)
                let alertController1 = UIAlertController(title: "Wrong Answer!", message:
                    "Please try answering the question again.", preferredStyle: UIAlertControllerStyle.alert)
                alertController1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController1, animated: true, completion: nil)
            }
        }
    }
    
    //Hide keyboard when user touches outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //Resign keyboard when "Done" button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answer.resignFirstResponder()
        return true
    }
    
    @IBAction func dismissToGallery(_ sender: Any) {
    }
    
    
    @IBAction func lookupOnlineReference(_ sender: Any) {
    }
    
    @IBAction func presentFullScreenPaintingVC(_ sender: Any) {
    }
    
}
