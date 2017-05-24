//
//  FindCollectionViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/10/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class FindCollectionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var artTitle: UITextView!
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artArtist: UILabel!
    @IBOutlet weak var artObjectDate: UILabel!
    @IBOutlet weak var artMedium: UITextView!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var collectionPickerView: UIPickerView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var object: ArtObject?
    
    
    //Collection Picker View Answer Modular
    let collectionPicker = ["American Art", "Arts of Africa", "Arts of the Americas", "Arts of the Islamic World", "Arts of the Pacific Islands", "Asian Art", "Contemporary Art", "Decorative Arts", "Egyptian, Classical, Ancient Near Eastern Art", "Elizabeth A. Sackler Center for Feminist Art", "European Art", "Libraries and Archives"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return collectionPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return collectionPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        answer.text = collectionPicker[row]
    }
    
    //Begin viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.answer.delegate = self
        
        artArtist.text = object?.artist?.name
        if let artObjectImageURLString = object?.primaryImageURLString {
            artImage.downLoadImage(from: artObjectImageURLString)
            artObjectDate.text = object?.object_date
            artTitle?.text = object?.title
            artMedium.text = object?.medium
            scoreLabel.text? = String(UserDefaults.standard.score)
            APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
                self.object = self.object
            })
        }
    }
    
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        if let userInput = answer?.text?.lowercased(), let actualAnswer = object?.collection?.name?.lowercased() {
            if actualAnswer.contains(userInput) {// ALERT MESSAGES: For right and wrong answers
                UserDefaults.standard.score += 10
                //Dismisses the segue when the answer is correct
                scoreLabel.text? = String(UserDefaults.standard.score)
                let alertController2 = UIAlertController(title: "Correct Answer!", message:
                    "You got it right! Click OK to keep playing.", preferredStyle: UIAlertControllerStyle.alert)
                alertController2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alertAction: UIAlertAction) in
                    let _ = self.navigationController?.popViewController(animated: true)}))
                self.present(alertController2, animated: true, completion: nil)
            } else {
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
}
