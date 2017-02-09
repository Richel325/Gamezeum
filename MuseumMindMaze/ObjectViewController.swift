//
//  ViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/30/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
import SafariServices

class ObjectViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var objectTableView: UITableView!
    
    var objects = [LocationObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(completion: { (objects: [LocationObject]?) -> () in
            self.objects = objects!
            self.objectTableView.reloadData()
        })
    }
    
}



//extension ObjectViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let object = objects[indexPath.row]
//    }
//}



extension ObjectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artObjectCell", for: indexPath) as! ArtObjectCell
        let indexPath = Int(arc4random_uniform(UInt32(max(0, objects.count-1))))
        let object = objects[indexPath]
        cell.objectTitle.text = object.title
        if let artObjectImageURLString = object.primaryImageURLString {
            cell.objectImage.downLoadImage(from: artObjectImageURLString)
        } else {
            cell.objectImage.image = nil
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

