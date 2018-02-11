//
//  Club.swift
//  IDK
//
//  Created by Student on 2018-01-31.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

struct Club {
    var ClubNa: String
    var ClubPa: String
    var ClubCellImageName: UIImage? = nil
    static var clubs = [Club]()
    
    
    init(ClubNa: String, ClubPa: String, ClubCellImageName: UIImage) {
        self.ClubNa = ClubNa
        self.ClubPa = ClubPa
        self.ClubCellImageName = ClubCellImageName
    }
    
}

var clubId: String = ""
var actualClubName: String = ""
var actualClubPassword: String = ""
var myAvatar: UIImage? = nil
