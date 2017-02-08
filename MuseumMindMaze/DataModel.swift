//
//  DataModel.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/31/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit

var objects = [ShortObject]()
//add: powered by BrooklynMuseum with a link to the site

class LocationObject { //condensed art object listing including museum location and collection
    var ID: Int?
    var title: String?
    var accession_number: String?
    var primary_image: String?
    var museum_location_id: Int?
    var collection_id: Int?
    var floor: Int?
    var parent_location_id: Int?
    var parent_location_description: String?
    
    init(jsonObject : [String : AnyObject]?) {
        self.ID = jsonObject?["id"] as? Int
        self.title = jsonObject?["title"] as? String
        self.accession_number = jsonObject?["accession_number"] as? String
        self.primary_image = jsonObject?["primary_image"] as? String
        self.museum_location_id = jsonObject?["museum_location_id"] as? Int
        self.collection_id = jsonObject?["collection_id"] as? Int
        self.floor = jsonObject?["floor"] as? Int
        self.parent_location_id = jsonObject?["parent_location_id"] as? Int
        self.parent_location_description = jsonObject?["parent_location_description"] as? String
    }
}



class ShortObject { //condensed art object listing
    var ID: Int?
    var title: String?
    var accession_number: String?
    var primary_image: String?
    
    init(jsonObject : [String : AnyObject]?) {
        self.ID = jsonObject?["id"] as? Int
        self.title = jsonObject?["title"] as? String
        self.accession_number = jsonObject?["accession_number"] as? String
        self.primary_image = jsonObject?["primary_image"] as? String
    }
}

extension ShortObject {
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

