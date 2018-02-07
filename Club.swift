//
//  Club.swift
//  IDK
//
//  Created by Student on 2018-01-31.
//  Copyright © 2018 No Clue. All rights reserved.
//

import Foundation

struct Club {
    var ClubNa: String
    var ClubPa: String
    static var clubs = [String: String]()
    
    
    init(ClubNa: String, ClubPa: String) {
        self.ClubNa = ClubNa
        self.ClubPa = ClubPa
    }
    
}

var clubId: String = ""
