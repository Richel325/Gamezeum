//
//  APIModel.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/31/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit


class APIClient{
    
    static let APIKey = "YxAQk6MfcwSMr6k1Grrh1drvIz6afNzm"
    
    static func getData(completion: @escaping ([ArtObject]?) -> ()) {
        DispatchQueue.global(qos: .background).async{
            
            let endpoint = "https://www.brooklynmuseum.org/api/v2/object"
            var url = URLRequest(url: URL(string: endpoint)!)
            url.addValue(APIKey, forHTTPHeaderField: "api_key")
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: url) { data, _, _ in
                let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                let art = self.getObjects(json)
                
                DispatchQueue.main.async {
                    completion(art)
                }
            }
            task.resume()
        }
    }
    
    static func getObjects(_ json: [String: Any]) -> [ArtObject] {
        
        var objects = [ArtObject]()
        if let listOfObjects = json["data"] as? [[String: AnyObject]] {
            _ = Int(arc4random_uniform(UInt32(max(0, listOfObjects.count-1))))
            for jsonObject in listOfObjects {
                let object = ArtObject(jsonObject: jsonObject)
                objects.append(object)
            }
        }
        return objects
    }
}
