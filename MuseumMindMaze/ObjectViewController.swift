//
//  ViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/30/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
import SafariServices

class ObjectViewController: UIViewController {
    
    @IBOutlet weak var objectTableView: UITableView!
    
    var objects = [ShortObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(completion: { (objects: [ShortObject]?) -> () in
            self.objects = objects!
            self.objectTableView.reloadData()
        })
    }
    
}



extension ObjectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = objects[indexPath.row]
        let safari = SFSafariViewController(url: URL(string: object.primary_image!)!)
        navigationController?.pushViewController(safari, animated: true)
    }
}



extension ObjectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "artObjectCell", for: indexPath) as! ArtObjectCell
            let object = objects[indexPath.row]
            cell.objectTitle.text = object.title
            cell.objectImage.downLoadImage(from: object.primary_image!)
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

