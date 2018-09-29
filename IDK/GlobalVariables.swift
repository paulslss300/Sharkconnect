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

var userId: String = ""

var loggedInClub: Club? = nil
var loggedInStudent: Student? = nil

var loggedInAsClub: Bool = false

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

func logIn(username: String, password: String, loggedInState: Bool) -> Bool {
    
    if loggedInState {
        
        ///////////////////////////CLUB LOGIN ROUTE//////////////////////////////
        
        var clubLoginSuccessful: Bool = false
        
        for clubAccount in clubs {
            if username == clubAccount.ClubNa && password == clubAccount.ClubPa {
                clubLoginSuccessful = true
                loggedInClub = clubAccount
                userId = username
                break
            } else {
                clubLoginSuccessful = false
            }
        }
        
        if clubLoginSuccessful {
            
            guard let loggedInClub = loggedInClub else {
                return false
            }
            
            // add school (only works once)
            if (loggedInClub.subscribedClubs).isEmpty {
                for club in clubs {
                    if club.ClubNa == "School" {
                        loggedInClub.subscribedClubs += [club]
                    }
                }
            }
            // add subscribed posts
            for post in Post.posts {
                for club in (loggedInClub.subscribedClubs) {
                    if post.clubIdentifier == club.ClubNa {
                        subscribedPosts += [post]
                    }
                }
            }
        }
        
        return clubLoginSuccessful
        
        /////////////////////////////////////////////////////////////////////////
        
    } else {
        
        ///////////////////////////STUDENT LOGIN ROUTE///////////////////////////
        
        var loginSuccessful: Bool = false
        
        for studentAccount in students {
            if username == studentAccount.StudentNa && password == studentAccount.StudentPa {
                loginSuccessful = true
                userId = "studentRandomNumber10382"
                loggedInStudent = studentAccount
                break
                
            } else {
                loginSuccessful = false
            }
        }
        
        if loginSuccessful {
            
            guard let loggedInStudent = loggedInStudent else {
                return false
            }
            
            // add school (only works once)
            if (loggedInStudent.subscribedClubs).isEmpty {
                for club in clubs {
                    if club.ClubNa == "School" {
                        loggedInStudent.subscribedClubs += [club]
                    }
                }
            }
            // add subscribed posts
            for post in Post.posts {
                for club in (loggedInStudent.subscribedClubs) {
                    if post.clubIdentifier == club.ClubNa {
                        subscribedPosts += [post]
                    }
                }
            }
        }
        
        return loginSuccessful
        
        /////////////////////////////////////////////////////////////////////////
        
    }
    
}


//AUTO LOGIN BRANCHING

class Switcher {
    
    static func updateRootVC(){
        
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        
        guard let loggedInState = UserDefaults.standard.object(forKey: "loggedInAsClub") as? Bool else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! SelectSchoolViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
            return
        }
        
        loggedInAsClub = loggedInState
        
        let keychain = KeychainSwift()
        guard let username = keychain.get("username") else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! SelectSchoolViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
            return
        }
        
        guard let password = keychain.get("password") else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! SelectSchoolViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
            return
        }
        
        if(status == true) && logIn(username: username, password: password, loggedInState: loggedInState) {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! TabBarViewController
        }else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! SelectSchoolViewController
            //Delete stored username and password and loggedInAsClub
            let keychain = KeychainSwift()
            keychain.delete("username")
            keychain.delete("password")
            UserDefaults.standard.removeObject(forKey: "loggedInAsClub")
            UserDefaults.standard.set(false, forKey: "status")
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
    }
}

