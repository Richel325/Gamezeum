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
import SafariServices


class FindCollectionViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var artTitle: UILabel!
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var answerStackView: UIStackView!
    
    
    var object: ArtObject?
    var museumURL : String = "https://www.brooklynmuseum.org/opencollection/objects/"
    
    //Collection Array for Button Answers
    var collectionArray = ["American Art", "Arts of Africa", "Arts of the Americas", "Arts of the Islamic World", "Arts of the Pacific Islands", "Asian Art", "Contemporary Art", "Decorative Arts", "Egyptian, Classical, Ancient Near Eastern Art", "Elizabeth A. Sackler Center for Feminist Art", "European Art", "Libraries and Archives"]
    
    
    
    //Begin viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.answer.delegate = self
        
        self.answerStackView.layer.cornerRadius = 4.75
        
        
        if let artObjectImageURLString = object?.primaryImageURLString {
            artImage.downLoadImage(from: artObjectImageURLString)
            artTitle?.text = object?.title
            scoreLabel.text? = String(UserDefaults.standard.score)
            APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
                self.object = self.object
            })
        }
        
        
        //populate buttons with random string from array of museum collections
        let buttons = [answer1, answer2, answer3, answer4]
        let answerIndex = Int(arc4random_uniform(UInt32(3)))
        for button in buttons {
            if buttons.count == answerIndex {
                button!.setTitle(object?.collection?.name, for: .normal)
            } else {
                let index = Int(arc4random_uniform(UInt32(collectionArray.count)))
                button!.setTitle(collectionArray[index], for: .normal)
                collectionArray.remove(at: index)
            }
            
        }
        
    }
    
    
    
    
    @IBAction func submitAnswer1(_ sender: UIButton) {
        if let userInput = answer1.currentTitle?.lowercased(), let actualAnswer = object?.collection?.name?.lowercased() {
            if actualAnswer.contains(userInput) {// ALERT MESSAGES: For right and wrong answers
                AudioServicesPlayAlertSound(1325)
                UserDefaults.standard.score += 10
                //Dismisses the segue when the answer is correct
                scoreLabel.text? = String(UserDefaults.standard.score)
                let alertController2 = UIAlertController(title: "Correct Answer!", message:
                    "You got it right! Click OK to keep playing.", preferredStyle: UIAlertControllerStyle.alert)
                alertController2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alertAction: UIAlertAction) in
                    let _ = self.dismiss(animated: true)}))
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
    
    @IBAction func submitAnswer2(_ sender: UIButton) {
        if let userInput = answer2.currentTitle?.lowercased(),
            let actualAnswer = object?.collection?.name?.lowercased() {
            if actualAnswer.contains(userInput) {// ALERT MESSAGES: For right and wrong answers
                AudioServicesPlayAlertSound(1325)
                UserDefaults.standard.score += 10
                //Dismisses the segue when the answer is correct
                scoreLabel.text? = String(UserDefaults.standard.score)
                let alertController2 = UIAlertController(title: "Correct Answer!", message:
                    "You got it right! Click OK to keep playing.", preferredStyle: UIAlertControllerStyle.alert)
                alertController2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alertAction: UIAlertAction) in
                    let _ =
                    self.dismiss(animated: true)}))
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
    
    @IBAction func submitAnswer3(_ sender: UIButton) {
        if let userInput = answer3.currentTitle?.lowercased(), let actualAnswer = object?.collection?.name?.lowercased() {
            if actualAnswer.contains(userInput) {// ALERT MESSAGES: For right and wrong answers
                AudioServicesPlayAlertSound(1325)
                UserDefaults.standard.score += 10
                //Dismisses the segue when the answer is correct
                scoreLabel.text? = String(UserDefaults.standard.score)
                let alertController2 = UIAlertController(title: "Correct Answer!", message:
                    "You got it right! Click OK to keep playing.", preferredStyle: UIAlertControllerStyle.alert)
                alertController2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alertAction: UIAlertAction) in
                    let _ = self.dismiss(animated: true)}))
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
    
    @IBAction func submitAnswer4(_ sender: UIButton) {
        if let userInput = answer4.currentTitle?.lowercased(), let actualAnswer = object?.collection?.name?.lowercased() {
            if actualAnswer.contains(userInput) {// ALERT MESSAGES: For right and wrong answers
                AudioServicesPlayAlertSound(1325)
                UserDefaults.standard.score += 10
                //Dismisses the segue when the answer is correct
                scoreLabel.text? = String(UserDefaults.standard.score)
                let alertController2 = UIAlertController(title: "Correct Answer!", message:
                    "You got it right! Click OK to keep playing.", preferredStyle: UIAlertControllerStyle.alert)
                alertController2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alertAction: UIAlertAction) in
                    let _ = self.dismiss(animated: true)}))
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
    
    
    
    
    
    @IBAction func dismissToGallery(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func lookupOnlineReference(_ sender: Any) {
        let url = URL(string: "\(museumURL)\(object!.id!)")
        let svc = SFSafariViewController(url: url!)
        self.present(svc, animated: true, completion: nil)
        print(url!)
    }
    
    @IBAction func presentFullScreenPaintingVC(_ sender: Any) {
    }
    
}
