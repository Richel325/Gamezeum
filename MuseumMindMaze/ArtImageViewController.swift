//
//  ArtImageViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/12/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class ArtImageViewController: UIViewController {
    
    
    @IBOutlet weak var artImageTableView: UITableView!
    
    var objects = [ArtObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
            self.objects = objects!
            self.artImageTableView.reloadData()
        })
        
    }
}


extension ArtImageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch QuestionVC.randomQuestionVC() {
        case .one:
            performSegue(withIdentifier: "to_find_medium", sender: nil)
        case .two:
            performSegue(withIdentifier: "to_find_collection", sender: nil)
        }
    }
}


func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier ?? "" {
    case "to_find_medium":
        let destination = segue.destination as! UINavigationController
        destination.viewControllers[0] as! MediumViewController
    case "to_find_collection":
        let destination = segue.destination as! UINavigationController
        destination.viewControllers[1] as! FindCollectionViewController
    default:
        break
    }
}



extension ArtImageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artImageCell", for: indexPath) as! ArtImageTableViewCell
        let object = objects[indexPath.row]
        if let artObjectImageURLString = object.primaryImageURLString {
            cell.artImage.downLoadImage(from: artObjectImageURLString)
        } else {
            cell.artImage.image = nil
        }
        return cell
    }
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

