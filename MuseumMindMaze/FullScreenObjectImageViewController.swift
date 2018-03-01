//
//  FullScreenObjectImageViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 12/7/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

class FullScreenObjectImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var paintingScrollView: UIScrollView!
    
    var object: ArtObject?
    var paintingImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        paintingScrollView.contentSize = CGSize(width: paintingImageView.frame.width, height: paintingImageView.frame.height)
        paintingScrollView.bounces = false
        paintingScrollView.bouncesZoom = true
        paintingScrollView.minimumZoomScale = 0.3
        paintingScrollView.maximumZoomScale = 2
        
        if let artObjectImageURLString = object?.primaryImageURLString {
            paintingImageView.downLoadImage(from: artObjectImageURLString)
            APIClient.getData(completion: { (objects: [ArtObject]?) -> () in
                self.object = self.object
            })
        }
        
        paintingScrollView.addSubview(paintingImageView)
    }
    
    
    @IBAction func dismissToPaintingDetail(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? { return paintingImageView }
    
}
