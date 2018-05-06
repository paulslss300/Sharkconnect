//
//  Note.swift
//  IDK
//
//  Created by Shir Dayan on 2018-05-04.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

var allNotes:[Note] = []
var currentNoteIndex:Int = -1
var noteTable:UITableView?

let kAllNotes:String = "notes"

class Note: NSObject {
    var date:String
    var note:String
    
    override init() {
        date = NSDate().description
        note = ""
    }
    
    func dictionary() -> NSDictionary {
        return ["note":note, "date":date]
    }
    
    class func saveNotes (){
        var aDictionaries:[NSDictionary] = []
        for var i:Int = 0; i < allNotes.count; i++ {
            aDictionaries.append(allNotes[i].dictionary())
        }
        UserDefaults.standardUserDefaults().setObject(aDictionaries, forkey: kAllNotes)
    }
    
    class func loadNotes() {
        var defaults:UserDefaults = UserDefaults.standard
        var savedData:[NSDictionary]? = defaults.object(forKey: kAllNotes) as? [NSDictionary]
        if let data:[NSDictionary] = savedData{
            for var i:Int = 0; i < data.count; i++ {
                        var n:Note = Note()
                n.setValuesForKeys(data[i])
                allNotes.append(n)
            }
        }
    }
}

/*  for club in subscribedClubs {
 if (selectedClub?.ClubNa)! == club.ClubNa {
 noDuplicate = false
 subscribedClubs = subscribedClubs.filter({ (club) -> Bool in
 return !(club.ClubNa == selectedClub?.ClubNa)
 })
 break
 }
 }*/
