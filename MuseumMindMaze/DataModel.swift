//
//  DataModel.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 1/31/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit


//add: powered by BrooklynMuseum with a link to the site

 
class ArtObjectCollection { //collection the art object is categorized under
    var ID: Int
    var name: String
    var folder: String
    var rank: Int
    
    init(ID: Int, name: String, folder: String, rank: Int) {
        self.ID = ID
        self.name = name
        self.folder = folder
        self.rank = rank
    }
}


class LocationObject { //condensed art object listing including museum location and collection
    var ID: Int
    var title: String
    var accession_number: String
    var primary_image: String
    var museum_location_id: Int
    var collection_id: Int //how to make this the same as the id shown above in artobjectcollection?
    var floor: Int
    var parent_location_id: Int
    var parent_location_description: String
    
    init(ID: Int, title: String, accession_number: String, primary_image: String, museum_location_id: Int, collection_id: Int, floor: Int, parent_location_id: Int, parent_location_description: String) {
        self.ID = ID
        self.title = title
        self.accession_number = accession_number
        self.primary_image = primary_image
        self.museum_location_id = museum_location_id
        self.collection_id = collection_id
        self.floor = floor
        self.parent_location_id = parent_location_id
        self.parent_location_description = parent_location_description
    }
}


class Artist {//artist who created the art object
    var ID: Int
    var name: String
    var nationality: String
    var primary_image: String
    var start_year: Int
    var end_year: Int
    var role: Int

    
    init(ID: Int, name: String, nationality: String, primary_image: String, start_year: Int, end_year: Int, role: Int) {
        self.ID = ID
        self.name = name
        self.nationality = nationality
        self.primary_image = primary_image
        self.start_year = start_year
        self.end_year = end_year
        self.role = role
    }
}



class Exhibition {
    var ID: Int
    var collections: [ArtObjectCollection]
    var images: [String]
    var labels: [Label]
    var title: String
    var primary_image: String
    var start_date: Int
    var end_date: Int
    var location: String
    
    
    init(ID: Int, collections: [ArtObjectCollection], images: [String], labels: [Label], title: String, primary_image: String, start_date: Int, end_date: Int, location: String) {
        self.ID = ID
        self.collections = collections
        self.images = images
        self.labels = labels
        self.title = title
        self.primary_image = primary_image
        self.start_date = start_date
        self.end_date = end_date
        self.location = location
    }
}


class Label {
    
    var ID: Int
    var title: String
    var content: String
    var summary: String
    
    init(ID: Int, title: String, content: String, summary: String) {
        self.ID = ID
        self.title = title
        self.content = content
        self.summary = summary
    }
}
 
 
 
