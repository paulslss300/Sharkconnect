//
//  AppDelegate.swift
//  IDK
//
//  Created by Student on 2018-01-09.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // this is to populate the student array
        //without this, feature won't work
        let firstStudent = Student.init(StudentNa: "Bob", StudentPa: "123")
        Student.students += [firstStudent]
        
        // this is to populate the club array
        //without this, feature won't work
        let firstClub = Club.init(ClubNa: "firstClub", ClubPa: "456")
        Club.clubs += [firstClub]
        
        // Override point for customization after application launch.
        // Load the sample data.
        loadSampleClubs()
        
        return true
    }
    
    private func loadSampleClubs() {
        
        let photo1 = UIImage(named: "dramaclub")
        let photo2 = UIImage(named: "interactclub")
        let photo3 = UIImage(named: "studentcouncil")
        let photo4 = UIImage(named: "artclub")
        let photo5 = UIImage(named: "stemclub")
        let photo6 = UIImage(named: "mathclub")
        
        // Populate Clubs
        let clubcell1 = ClubCell(ClubCellTi: "Drama Club", ClubCellImageName: photo1!)
        ClubCell.clubcells += [clubcell1]
        
        let clubcell2 = ClubCell(ClubCellTi: "Interact Club", ClubCellImageName: photo2!)
        ClubCell.clubcells += [clubcell2]
        
        let clubcell3 = ClubCell(ClubCellTi: "Student Council", ClubCellImageName: photo3!)
        ClubCell.clubcells += [clubcell3]
        
        let clubcell4 = ClubCell(ClubCellTi: "Art Club", ClubCellImageName: photo4!)
        ClubCell.clubcells += [clubcell4]
        
        let clubcell5 = ClubCell(ClubCellTi: "STEM Club", ClubCellImageName: photo5!)
        ClubCell.clubcells += [clubcell5]
        
        let clubcell6 = ClubCell(ClubCellTi: "Math Club", ClubCellImageName: photo6!)
        ClubCell.clubcells += [clubcell6]
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

