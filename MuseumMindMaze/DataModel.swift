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

    var artist: Artist
    var museumLocation: MuseumLocation
    var collection: Collection
    var label: Label
    
    init(jsonObject : [String : AnyObject]?) {
        self.ID = jsonObject?["id"] as? Int
        self.title = jsonObject?["title"] as? String
        self.object_date = jsonObject?["object_date"] as? String
        self.medium = jsonObject?["medium"] as? String
        self.description = jsonObject?["description"] as? String
        self.primary_image = jsonObject?["primary_image"] as? String
        
        let artistJSON = jsonObject?["artists"]
        artist = Artist(jsonObject: artistJSON as! [String : AnyObject]?)
        
        let museumLocationJSON = jsonObject?["museum_location"] as! [String : AnyObject]
        museumLocation = MuseumLocation(jsonObject: museumLocationJSON)
        
        let collectionJSON = jsonObject?["collections"] as! [String : AnyObject]
        collection = Collection(jsonObject: collectionJSON)
        
        let labelJSON = jsonObject?["labels"] as! [String : AnyObject]
        label = Label(jsonObject: labelJSON)
    }
}


extension ArtObject {//to get the URL of the artObjectImage
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


class MuseumLocation {
    var name: String?
    var is_public: Int?
    
    init(jsonObject : [String : AnyObject]?) {
        self.name = jsonObject?["name"] as? String
        self.is_public = jsonObject?["is_public"] as? Int
    }
}


class Artist {
    var prefix: String?
    var name: String?
    var nationality: String?
    var date: String?
    
    init(jsonObject : [String : AnyObject]?) {
        self.prefix = jsonObject?["prefix"] as? String
        self.name = jsonObject?["name"] as? String
        self.nationality = jsonObject?["nationality"] as? String
        self.date = jsonObject?["date"] as? String
    }
}


class Collection {
    var ID: Int?
    var name: String?
    var folder: String?
    

    init(jsonObject : [String : AnyObject]?) {
        self.ID = jsonObject?["id"] as? Int
        self.name = jsonObject?["name"] as? String
        self.folder = jsonObject?["folder"] as? String
    }
}


class Label {
    var content: String?
    
    init(jsonObject : [String : AnyObject]?) {
        self.content = jsonObject?["content"] as? String
    }
}



