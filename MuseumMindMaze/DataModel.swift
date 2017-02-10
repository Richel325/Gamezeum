//
//  DataModel.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/31/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit

var objects = [ArtObject]()
//add: powered by BrooklynMuseum with a link to the site

class ArtObject { //condensed art object listing including museum location and collection
    var ID: Int?
    var title: String?
    var object_date: String?
    var medium: String?
    var description: String?
    var primary_image: String?
    var floor: Int?
    
    init(jsonObject : [String : AnyObject]?) {
        self.ID = jsonObject?["id"] as? Int
        self.title = jsonObject?["title"] as? String
        self.object_date = jsonObject?["object_date"] as? String
        self.medium = jsonObject?["medium"] as? String
        self.description = jsonObject?["description"] as? String
        self.primary_image = jsonObject?["primary_image"] as? String
        self.floor = jsonObject?["floor"] as? Int
    }
}


extension ArtObject {
    var primaryImageURLString : String? {
        if let primary_image = primary_image {
            return "https://d1lfxha3ugu3d4.cloudfront.net/images/opencollection/objects/size2/" + primary_image
        } else {
            return nil
        }
    }
    var primaryImageURL : URL? {
        return URL(string: primaryImageURLString ?? "")
    }
}
