//
//  GlobalVariables.swift
//  IDK
//
//  Created by Paul Tang on 2018-03-27.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit
import os.log

var clubs = [Club]()
var students = [Student]()
var schools = [School]()
var loggedInAsClub: Bool = false

var userId: String = ""

var loggedInClub: Club? = nil
var loggedInStudent: Student? = nil

var subscribedPosts = [Post]()

// 37 dates
var selectedMonth = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
var noteList = [Note]()

class School {
    var SchoolNa: String
    var SchoolPa: String
    var SchoolDe: String
    var SchoolImage: UIImage
    var Clubs = [Club]()
    var Students = [Student]()
    
    init(SchoolNa: String, SchoolPa: String, SchoolDe: String, SchoolImage: UIImage) {
        self.SchoolNa = SchoolNa
        self.SchoolDe = SchoolDe
        self.SchoolPa = SchoolPa
        self.SchoolImage = SchoolImage
    }
}

class Note: NSObject, NSCoding {
    var noteDe: String
    var timeCreated: String
    var noteDa: String? = nil
    
    init(noteDe: String, timeCreated: String, noteDa: String?) {
        self.noteDe = noteDe
        self.timeCreated = timeCreated
        self.noteDa = noteDa
    }
    
    //MARK: NSCoding
    func encode(with Coder: NSCoder) {
        Coder.encode(noteDe, forKey: PropertyKey.noteDe)
        Coder.encode(noteDa, forKey: PropertyKey.noteDa)
        Coder.encode(timeCreated, forKey: PropertyKey.timeCreated)

    }
    
    required convenience init?(coder Decoder: NSCoder) {
        // The noteDe is required. If we cannot decode a name string, the initializer should fail.
        guard let noteDe = Decoder.decodeObject(forKey: PropertyKey.noteDe) as? String else {
            os_log("Unable to decode the noteDe for a Note object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let timeCreated = Decoder.decodeObject(forKey: PropertyKey.timeCreated) as? String else {
            os_log("Unable to decode the timeCreated for a Note object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because noteDa is an optional property of Note, just use conditional cast.
        let noteDa = Decoder.decodeObject(forKey: PropertyKey.noteDa) as? String
        
        // Must call designated initializer.
        self.init(noteDe: noteDe, timeCreated: timeCreated, noteDa: noteDa!)
        
    }
    
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("notes")
}

struct PropertyKey {
    static let noteDe = "noteDe"
    static let noteDa = "noteDa"
    static let timeCreated = "timeCreated"
}

class Post {
    var postTi: String
    var postDe: String
    var clubIdentifier: String
    var postImage: UIImage? = nil
    var postDa: String = ""
    var postedImage = [UIImage]()
    static var posts = [Post]()
    
    init(postTi: String, postDe: String, clubIdentifier: String, postImage: UIImage, postDa: String, postedImage: [UIImage]) {
        self.postTi = postTi
        self.postDe = postDe
        self.clubIdentifier = clubIdentifier
        self.postImage = postImage
        self.postDa = postDa
        self.postedImage = postedImage
 
    }
}

class Club {
    
    var ClubNa: String
    var ClubPa: String
    var ClubDe: String
    var ClubCellImageName: UIImage? = nil
    var ClubCellCoverImage: UIImage? = nil
    var subscribedClubs = [Club]()
    
    init(ClubNa: String, ClubPa: String, ClubDe: String, ClubCellImageName: UIImage, ClubCellCoverImage: UIImage) {
        self.ClubNa = ClubNa
        self.ClubPa = ClubPa
        self.ClubDe = ClubDe
        self.ClubCellImageName = ClubCellImageName
        self.ClubCellCoverImage = ClubCellCoverImage
    }
}

class Student {
    var StudentNa: String
    var StudentPa: String
    var subscribedClubs = [Club]()
    
    init(StudentNa: String, StudentPa: String) {
        self.StudentNa = StudentNa
        self.StudentPa = StudentPa
    }
}
