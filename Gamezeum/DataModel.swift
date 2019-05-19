//
//  DataModel.swift
//  Gamezeum
//
//  Created by Richel Cuyler on 1/31/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit

var objects = [ArtObject]()

// MARK: - GLOBAL VARIABLES ------------------------
let application = UIApplication.shared


//MARK: - DATA MODEL -------------------------
class ArtObject { //condensed art object listing including artist, didactic labels, and collection
    var id: Int?
    var title: String?
    var object_date: String?
    var medium: String?
    var description: String?
    var primary_image: String?
    var artist: Artist?
    var collection: Collection?
    var label: Label?
    
    init(jsonObject : [String : AnyObject]?) {
        self.id = jsonObject?["id"] as? Int
        self.title = jsonObject?["title"] as? String
        self.object_date = jsonObject?["object_date"] as? String
        self.medium = jsonObject?["medium"] as? String
        self.description = jsonObject?["description"] as? String
        self.primary_image = jsonObject?["primary_image"] as? String
        
        let artistJSON = jsonObject?["artists"]
        if let aj = (artistJSON as? [[String : AnyObject]]) {
            if aj.count > 0 {
                artist = Artist(jsonObject: aj[0])}
        } else {
            let artist = Artist(jsonObject: nil)
            artist.name = "Unknown"
            print("Artist Unknown")
        }
        
        let collectionJSON = jsonObject?["collections"]
        if let co = (collectionJSON as? [[String : AnyObject]]) {
            if co.count > 0 {
                collection = Collection(jsonObject: co[0])}
        } else {
            let collection = Collection(jsonObject: nil)
            collection.name = "Unknown"
            print("Collection Unknown")
        }
        
        let labelJSON = jsonObject?["labels"]
        if let lj = (labelJSON as? [[String : AnyObject]]) {
            if lj.count > 0 {
                label = Label(jsonObject: lj[0])}
        } else {
            let label = Label(jsonObject: nil)
            label.content = "Unknown"
            print("Label Unknown")
        }
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
    var id: Int?
    var name: String?
    var folder: String?
    
    init(jsonObject : [String : AnyObject]?) {
        self.id = jsonObject?["id"] as? Int
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







