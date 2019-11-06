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
    
    static func getData(onViewOnly: Bool = false, completion: @escaping ([ArtObject]?) -> ()) {
        DispatchQueue.global(qos: .background).async{
<<<<<<< HEAD
<<<<<<< HEAD:Gamezeum/APIModel.swift
            let randomNumber: Int = Int(arc4random_uniform(UInt32(92290-35))) //TO DO: how many objects are there? Is this correct?
            let endpoint = "https://www.brooklynmuseum.org/api/v2/object?&has_images=1&rights_type_permissive=1&offset=\(randomNumber)"
           
=======
            let randomNumber: Int = Int(arc4random_uniform(UInt32(10000)))
            let endpoint = "https://www.brooklynmuseum.org/api/v2/object?offset=\(randomNumber)"
>>>>>>> 96aafcbfcbb955c03fd7ad1935c642b541b2fcd6:MuseumMindMaze/APIModel.swift
=======
<<<<<<< HEAD:MuseumMindMaze/APIModel.swift
            let randomNumber: Int = Int(arc4random_uniform(UInt32(10000)))
            let endpoint = "https://www.brooklynmuseum.org/api/v2/object?offset=\(randomNumber)"
=======
            let randomNumber: Int = Int(arc4random_uniform(UInt32(92290-35))) //TO DO: how many objects are there? Is this correct?
            let endpoint = "https://www.brooklynmuseum.org/api/v2/object?&has_images=1&rights_type_permissive=1&offset=\(randomNumber)"
           
>>>>>>> 16cb402b832133503c378ce8902f95e73a7365fa:Gamezeum/APIModel.swift
>>>>>>> e9e526146ca6ae5acbcb129f623e6d97daa1de8e
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
            for jsonObject in listOfObjects {
                let object = ArtObject(jsonObject: jsonObject)
                objects.append(object)
            }
        }
        return objects
    }
}
