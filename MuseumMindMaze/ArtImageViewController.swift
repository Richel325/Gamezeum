//
//  ArtImageViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/12/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

var selectedCellIndex: Int?
fileprivate var refreshControl : UIRefreshControl?

class ArtImageViewController: UIViewController {
    
    
    @IBOutlet weak var artImageTableView: UITableView!
    
    var objects = [ArtObject]()
    let mvc = MediumViewController()
    let fcv = FindCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
        let aRefreshControl = UIRefreshControl()
        aRefreshControl.addTarget(self, action: #selector(refreshControlAction(sender:)), for: .valueChanged)
        artImageTableView.addSubview(aRefreshControl)
        artImageTableView.alwaysBounceVertical = true
        refreshControl = aRefreshControl
    }
    
    
    func refreshControlAction(sender : Any?) {
        self.artImageTableView.reloadData()
        refreshControl?.endRefreshing()
        reload()
    }
    
    func reload() {
        APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
            self.objects = objects!.filter({ (obj:ArtObject) -> Bool in
                return obj.primary_image != nil
            })
            self.artImageTableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "to_find_medium":
            let mvc = segue.destination as! MediumViewController
            mvc.object = objects[(artImageTableView.indexPathForSelectedRow?.row) ?? 0]
        case "to_find_collection":
            let fcv = segue.destination as! FindCollectionViewController
            fcv.object = objects[(artImageTableView.indexPathForSelectedRow?.row) ?? 0]
        default:
            break
        }
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
        selectedCellIndex = indexPath.row
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

