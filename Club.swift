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
    var ClubCellCoverImage: UIImage? = nil
    static var clubs = [Club]()
    
    
    init(ClubNa: String, ClubPa: String, ClubCellImageName: UIImage, ClubCellCoverImage: UIImage) {
        self.ClubNa = ClubNa
        self.ClubPa = ClubPa
        self.ClubCellImageName = ClubCellImageName
        self.ClubCellCoverImage = ClubCellCoverImage
    }
    
}

var clubId: String = ""
var actualClubName: String = ""
var actualClubPassword: String = ""

var myAvatar: UIImage? = nil
var myClubCover: UIImage? = nil

var subscribedClubs = [Club]()
