//
//  QuestionVCEnum.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/11/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation

enum QuestionVC: Int {//Enum to randomize question storyboard segue
    case one = 0
    case two

    
    static func randomQuestionVC() -> QuestionVC {
        return QuestionVC(rawValue: Int(arc4random_uniform(2)))!
    }
}
