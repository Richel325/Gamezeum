//
//  MediumViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/10/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
<<<<<<< HEAD:MuseumMindMaze/MediumViewController.swift

class MediumViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var artTitle: UITextView!
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artArtist: UILabel!
    @IBOutlet weak var artObjectDate: UILabel!
    @IBOutlet weak var artDescription: UITextView!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
=======
import AVFoundation
import SafariServices

class MediumViewController: UIViewController, UITextFieldDelegate, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var artTitle: UILabel!
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
>>>>>>> 16cb402b832133503c378ce8902f95e73a7365fa:Gamezeum/MediumViewController.swift
    
    var object: ArtObject?
    var museumURL : String = "https://www.brooklynmuseum.org/opencollection/objects/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answer.delegate = self
        
        if let artObjectImageURLString = object?.primaryImageURLString {
            artImage.downLoadImage(from: artObjectImageURLString)
            artObjectDate.text = object?.object_date
            artTitle?.text = object?.title
            artDescription.text = object?.description
            scoreLabel.text? = String(UserDefaults.standard.score)
            APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
                self.object = self.object
            })
        }
        
    }
    
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        if let userInput = answer?.text?.lowercased(), let actualAnswer = object?.medium?.lowercased() {
            if actualAnswer.contains(userInput) {// ALERT MESSAGES: For right and wrong answers
                UserDefaults.standard.score += 10
                //Dismisses the segue when the answer is correct
                scoreLabel.text? = String(UserDefaults.standard.score)
                let alertController2 = UIAlertController(title: "Correct Answer!", message:
                    "You got it right! Click OK to keep playing.", preferredStyle: UIAlertControllerStyle.alert)
                alertController2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alertAction: UIAlertAction) in
                    let _ =
                    self.dismiss(animated: true)}))
                //add observer for dismissal to delete row in ArtImageTableView when an a question is answered correctly.
                NotificationCenter.default.post(name: NSNotification.Name("deleteReload"), object: nil)
                //need to reload the tableview after deleting? or does viewDidLoad handle this?
                self.present(alertController2, animated: true, completion: nil)
                
            } else {
<<<<<<< HEAD:MuseumMindMaze/MediumViewController.swift
=======
                
>>>>>>> 16cb402b832133503c378ce8902f95e73a7365fa:Gamezeum/MediumViewController.swift
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
    
    
<<<<<<< HEAD:MuseumMindMaze/MediumViewController.swift
=======
    
    
    
    @IBAction func dismissToGallery(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func lookupOnlineReference(_ sender: Any) {
        let url = URL(string: "\(museumURL)\(object!.id!)")
        let svc = SFSafariViewController(url: url!)
        self.present(svc, animated: true, completion: nil)
        print(url!)
    }
    

>>>>>>> 16cb402b832133503c378ce8902f95e73a7365fa:Gamezeum/MediumViewController.swift
}

