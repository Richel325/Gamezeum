//
//  ArtObjectCell.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 2/4/17.
//  Copyright © 2017 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit

class ArtObjectCell: UITableViewCell {
    
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var objectTitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
