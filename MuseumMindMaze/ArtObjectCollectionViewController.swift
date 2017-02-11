//
//  ArtObjectCollectionViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/9/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

private let reuseIdentifier = "artObjectCell"

class ArtObjectCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet var artImageCollectionView: UICollectionView!
    
    var objects = [ArtObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
            self.objects = objects!
            self.artImageCollectionView.reloadData()
        })
        
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    func collectionView1(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtObjectCollectionViewCell
        let indexPath = Int(arc4random_uniform(UInt32(max(0, objects.count-1))))
        let object = objects[indexPath]
        if let artObjectImageURLString = object.primaryImageURLString {
            cell.artImage.downLoadImage(from: artObjectImageURLString)
        } else {
            cell.artImage.image = nil
        }
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch QuestionVC.randomQuestionVC() {
        case .one:
            performSegue(withIdentifier: "to_find_medium", sender: nil)
        case .two:
            performSegue(withIdentifier: "to_find_collection", sender: nil)
        case .three:
            performSegue(withIdentifier: "to_find_map_location", sender: nil)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "to_find_medium":
            let destination = segue.destination as! UINavigationController
            destination.viewControllers[0] as! MediumViewController
        case "to_find_collection":
            let destination = segue.destination as! UINavigationController
            destination.viewControllers[1] as! FindCollectionViewController
        case "to_find_map_location":
            let destination = segue.destination as! UINavigationController
            destination.viewControllers[2] as! MapLocationViewController
        default:
            break
        }
    }
    
    // MARK: UICollectionViewDelegate
    
    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    //    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }

}


extension UIImageView {
    func downLoadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}


