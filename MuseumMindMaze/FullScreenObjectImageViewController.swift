//
//  FullScreenObjectImageViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 12/7/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class FullScreenObjectImageViewController: UIViewController {
    
    var object: ArtObject?
    var paintingImageView: UIImageView!

    @IBOutlet weak var paintingScrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let artObjectImageURLString = object?.primaryImageURLString {
            paintingImageView.downLoadImage(from: artObjectImageURLString)
            APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
                self.object = self.object
            })
        }
        
    }
    
    
    @IBAction func presentFullScreenPaintingVC(_ sender: Any) {
        let fullScreenObjectImageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FullScreenObjectImageViewController") as! FullScreenObjectImageViewController
        //fullScreenObjectImageViewController.paintingIndex = indexPath.item
        fullScreenObjectImageViewController.paintingImageView = UIImageView(image: UIImage(named: ""))
        present(fullScreenObjectImageViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func dismissToPaintingDetail(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
