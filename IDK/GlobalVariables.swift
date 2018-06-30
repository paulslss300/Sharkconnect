//
//  GlobalVariables.swift
//  IDK
//
//  Created by Paul Tang on 2018-03-27.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

var clubId: String = ""
var actualClubName: String = ""
var actualClubPassword: String = ""

var myAvatar: UIImage? = nil
var myClubCover: UIImage? = nil
var MyDescription: String = ""

var subscribedClubs = [Club]()
var subscribedPosts = [Post]()
var imagesInPost = [UIImage]()

// 37 dates
var selectedMonth = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
var displayedPosts = [Post]()
var noteList = [Note]()

class Note {
    var noteDe: String
    var timeCreated: String
    var isHomework: Bool
    
    init(noteDe: String, timeCreated: String, isHomework: Bool) {
        self.noteDe = noteDe
        self.timeCreated = timeCreated
        self.isHomework = isHomework
    }
}

class Post {
    var postTi: String
    var postDe: String
    var clubIdentifier: String
    var postImage: UIImage? = nil
    var postDa: Date? = nil
    var postedImage: UIImage? = nil
    static var posts = [Post]()
    
    init(postTi: String, postDe: String, clubIdentifier: String, postImage: UIImage, postDa: Date?, postedImage: UIImage?) {
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
    static var clubs = [Club]()
    
    init(ClubNa: String, ClubPa: String, ClubDe: String, ClubCellImageName: UIImage, ClubCellCoverImage: UIImage) {
        self.ClubNa = ClubNa
        self.ClubPa = ClubPa
        self.ClubDe = ClubDe
        self.ClubCellImageName = ClubCellImageName
        self.ClubCellCoverImage = ClubCellCoverImage
    }
}

struct Student {
    var StudentNa: String
    var StudentPa: String
    static var students = [Student]()
    
    init(StudentNa: String, StudentPa: String) {
        self.StudentNa = StudentNa
        self.StudentPa = StudentPa
    }
}
