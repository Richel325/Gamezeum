//
//  CustomButton.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/13/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews();
        
        // Set border to specific float
        self.layer.cornerRadius = 4.0;
        
    }

}
