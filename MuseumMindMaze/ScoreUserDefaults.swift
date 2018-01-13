//
//  ScoreUserDefaults.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/14/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation

extension UserDefaults {
    fileprivate static let scoreID = "scoreID"
    var score : Int {
        get { return UserDefaults.standard.integer(forKey: UserDefaults.scoreID) }
        set { UserDefaults.standard.set(newValue, forKey: UserDefaults.scoreID) }
    }
    
    //userdefaults for music
    fileprivate static let musicStatus = "musicStatus"
    var music : Bool {
        get { return UserDefaults.standard.bool(forKey: "musicStatus") }
        set { UserDefaults.standard.set(bool, forKey: "musicStatus") }
    }
    
}
