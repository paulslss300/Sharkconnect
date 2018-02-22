//
//  Club.swift
//  IDK
//
//  Created by Student on 2018-01-31.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class Club {
    
    var ClubNa: String
    var ClubPa: String
    var ClubDe: String
    var ClubCellImageName: UIImage? = nil
    var ClubCellCoverImage: UIImage? = nil
    static var clubs = [Club]()
    
    
    init(ClubNa: String, ClubPa: String, ClubDe: String, ClubCellImageName: UIImage, ClubCellCoverImage: UIImage) {
        self.ClubNa = ClubNa
        self.ClubPa = ClubPa
        self.ClubDe = ClubDe
        self.ClubCellImageName = ClubCellImageName
        self.ClubCellCoverImage = ClubCellCoverImage
    }
    
}

var clubId: String = ""
var actualClubName: String = ""
var actualClubPassword: String = ""

var myAvatar: UIImage? = nil
var myClubCover: UIImage? = nil
var MyDescription: String = ""

var subscribedClubs = [Club]()
