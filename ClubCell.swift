//
//  ClubCell.swift
//  IDK
//
//  Created by Student on 2018-02-06.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

struct ClubCell {
    var ClubCellTi: String
    var ClubCellImageName: UIImage? = nil
    static var clubcells = [ClubCell]()
    
    init(ClubCellTi: String, ClubCellImageName: UIImage) {
        self.ClubCellTi = ClubCellTi
        self.ClubCellImageName = ClubCellImageName
    }
    
}

