//
//  ArtImageViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/12/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit
import Foundation

var selectedCellIndex: Int?
fileprivate var refreshControl : UIRefreshControl?

class ArtImageViewController: UIViewController {
    
    
    @IBOutlet weak var artImageTableView: UITableView!
    
    var objects = [ArtObject]()
    var replacementObjects = [ArtObject]()
    //var replacementObjectCount = 12
    
    let mvc = MediumViewController()
    let fcv = FindCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillReplacementObjects()
        
        NotificationCenter.default.addObserver(self, selector: #selector(deleteReload), name: NSNotification.Name("deleteReload"), object: nil)
        
        
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
    
    
    func fillReplacementObjects() {
        //still using getData with an updated completion to append objects to replacementObjects
        APIClient.getData(completion: { (replacementObjects: [ArtObject]?) -> () in
            self.replacementObjects = replacementObjects!.filter({ (obj:ArtObject) -> Bool in
                return obj.primary_image != nil
            })
        })
    }
    
    
    func appendFromReplacementObjects() {
        //after object is deleted from tableview, append object from replacementObjects to objects
        //does not need to make a networking call
        //when the replacement array gets to only 0 objects, append appendFromReplacementObjects with 12 new objects
        // use .count method to check count;
        if replacementObjects.count == 0 {
            fillReplacementObjects()
        }
        
        if replacementObjects.count != 0 {
            objects.append(replacementObjects[0])
            replacementObjects.remove(at: 0)
        }
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
    
    
    @objc func deleteReload() {
        //delete row then reload table and replace row with new object
        print("notifications working!")
        
        //each time we delete and reload, we move an object from the replacement array to the data source array
        //delete item from data source FIRST
        //delete row at index path with fade animation
        selectedCellIndex = artImageTableView.indexPathForSelectedRow?.row
        objects.remove(at: selectedCellIndex!)
        appendFromReplacementObjects()
        //insert row at index path with fade animation
        //keep track of index path of object/ the object you selected in didSelectRowAT
        artImageTableView.reloadData()
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

