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
    
    //userdefaults for music and sound effects
    
}
