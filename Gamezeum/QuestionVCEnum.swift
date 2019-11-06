//
//  QuestionVCEnum.swift
//  Gamezeum
//
//  Created by Richel Cuyler on 2/11/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation

enum QuestionVC: Int {//Enum to randomize question storyboard segue
    case one = 0
    case two
<<<<<<< HEAD
<<<<<<< HEAD:Gamezeum/QuestionVCEnum.swift

=======
>>>>>>> 96aafcbfcbb955c03fd7ad1935c642b541b2fcd6:MuseumMindMaze/QuestionVCEnum.swift
=======
<<<<<<< HEAD:MuseumMindMaze/QuestionVCEnum.swift
=======

>>>>>>> 16cb402b832133503c378ce8902f95e73a7365fa:Gamezeum/QuestionVCEnum.swift
>>>>>>> e9e526146ca6ae5acbcb129f623e6d97daa1de8e
    
    static func randomQuestionVC() -> QuestionVC {
        return QuestionVC(rawValue: Int(arc4random_uniform(2)))!
    }
}
