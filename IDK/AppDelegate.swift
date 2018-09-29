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
        
        let firstStudent = Student.init(StudentNa: "bob", StudentPa: "1")
        students += [firstStudent]

        // Load the sample data.
        loadSampleClubs()
        loadSamplePosts()
        
        // Created Sample School
        let photo1 = UIImage(named: "dramaclub")
        
        let sampleSchool = School.init(SchoolNa: "Steveston London Secondary School", SchoolPa: "password", SchoolDe: "Ths is SLSS", SchoolImage: photo1!)
        sampleSchool.Clubs += clubs
        sampleSchool.Students += students
        
        schools += [sampleSchool]
        
        //AUTO LOGIN BRANCHING
        Switcher.updateRootVC()
        
        return true
    }
    
        
    private func loadSampleClubs() {
        
        let photo1 = UIImage(named: "dramaclub")
        let photo2 = UIImage(named: "interactclub")
        let photo3 = UIImage(named: "studentcouncil")
        let photo4 = UIImage(named: "artclub")
        let photo5 = UIImage(named: "stemclub")
        let photo6 = UIImage(named: "mathclub")
        let photo13 = UIImage(named: "school")
        
        let photo7 = UIImage(named: "unnamed-4")
        let photo8 = UIImage(named: "unnamed-1")
        let photo9 = UIImage(named: "stuco")
        let photo10 = UIImage(named: "unnamed")
        let photo11 = UIImage(named: "unnamed-3")
        let photo12 = UIImage(named: "unnamed-2")
        let photo14 = UIImage(named: "schoolCover")
        
        // Populate Clubs
        let samplelub1 = Club(ClubNa: "Drama Club", ClubPa: "1", ClubDe: "Tell members what this group is about. Our newest production is R.E.D. and will be showing in two months! Written by students Emily Ison and Mandy Huang. We put on three to four plays a year. Our last play was High School Confidential - A  KDog Special. Our sponsor teacher? KDog aka Ms Kosar but please call her “KDog.” It makes her happy. Ecstatic. Absolutely glowing. :)",ClubCellImageName: photo1!, ClubCellCoverImage: photo7!)
        clubs += [samplelub1]
        
        let samplelub2 = Club(ClubNa: "Interact Club", ClubPa: "samplepassword", ClubDe: "Interact clubs are part of a larger organization called Rotary International. Our focus is on community involvement and service, demonstrated in our motto, service above self. \n Every project whether done through Interact or Rotary has an impact in our world. Handing out sandwiches to the hungry, fundraising to support charities, and participating in service projects are all ways that Interact and Rotary have helped to make our world a better place. ",ClubCellImageName: photo2!, ClubCellCoverImage: photo8!)
        clubs += [samplelub2]
        
        let samplelub3 = Club(ClubNa: "Student Council", ClubPa: "samplepassword", ClubDe: "Stay up to date with all the events around the school! \n Student Council meetings are Tuesdays at lunch in Ms. Levin's room. The first meeting will be on Tuesday, September 26th :)", ClubCellImageName: photo3!, ClubCellCoverImage: photo9!)
        clubs += [samplelub3]
        
        let samplelub4 = Club(ClubNa: "Art Club", ClubPa: "samplepassword", ClubDe: "Hello Everybody :) Welcome to SLSS Art Club! \n Feel free to add your friends who are interested in art club as well:D \n We host weekly art contests, annual gallery, and contribute to local charities in an artistic way! ", ClubCellImageName: photo4!, ClubCellCoverImage: photo10!)
        clubs += [samplelub4]
        
        let samplelub5 = Club(ClubNa: "STEM Club", ClubPa: "samplepassword", ClubDe: "Welcome to the SLSS STEM (Science, Technology, Engineering, and Math) Club! Meetings are held the first Monday lunch of every month in Ms Ranis' room (room 702). We have leadership opportunities, guest speakers, workshops, and more! See you all there!! ", ClubCellImageName: photo5!, ClubCellCoverImage: photo11!)
        clubs += [samplelub5]
        
        let samplelub6 = Club(ClubNa: "Math Club", ClubPa: "samplepassword", ClubDe: "SLSS Math Club, the only place people buy 64 watermelons and no one wonders why... \n Meetings every Wednesday at lunch in room X.", ClubCellImageName: photo6!, ClubCellCoverImage: photo12!)
        clubs += [samplelub6]
        
        let school = Club(ClubNa: "School", ClubPa: "samplepassword", ClubDe: "This is the school", ClubCellImageName: photo13!, ClubCellCoverImage: photo14!)
        clubs += [school]
    }
    
    private func loadSamplePosts() {
        
        let photo2 = UIImage(named: "interactclub")
        let photo3 = UIImage(named: "studentcouncil")
        let photo4 = UIImage(named: "artclub")
        let photo5 = UIImage(named: "stemclub")
        let photo6 = UIImage(named: "mathclub")
        let photo13 = UIImage(named: "school")
        
        let samplePost2 = Post.init(postTi: "Update", postDe: "Cayley, Pascal and Gauss math contests are on Tuesday. Talk to Mr.Lin if you want to participate", clubIdentifier: "Math Club", postImage: photo6!, postDa: "2018-08-02", postedImage: [#imageLiteral(resourceName: "image2")])
        let samplePost25 = Post.init(postTi: "Notice", postDe: "Hey guys! There will be no general meeting tomorrow. More updates on our projects will be coming up next week!", clubIdentifier: "Math Club", postImage: photo6!, postDa: "2018-08-30", postedImage: [#imageLiteral(resourceName: "image3")])
        Post.posts += [samplePost2]
        Post.posts += [samplePost2]
        Post.posts += [samplePost2]
        Post.posts += [samplePost2]
        Post.posts += [samplePost25]
      
        let samplePost3 = Post.init(postTi: "Notice", postDe: "Hey guys! There will be no general meeting tomorrow. More updates on our projects will be coming up next week!", clubIdentifier: "Interact Club", postImage: photo2!, postDa: "2018-09-13", postedImage: [#imageLiteral(resourceName: "image3")])
        Post.posts += [samplePost3]

        let samplePost4 = Post.init(postTi: "New Program!", postDe: "The Team Challenges Program is back for our first event of 2018! On Friday, Mar. 9 at JN Burnett Secondary, join them for TCP World Domination with snacks and prizes included for only $2 a person.", clubIdentifier: "STEM Club", postImage: photo5!, postDa: "2018-09-11", postedImage: [#imageLiteral(resourceName: "image4")])
        Post.posts += [samplePost4]
    
        let samplePost5 = Post.init(postTi: "Upcoming meeting!", postDe: "Meeting today in room 202, we will talking more about our upcoming showcase and showing you guys some art pieces for inspiration :)", clubIdentifier: "Art Club", postImage: photo4!, postDa: "2018-09-08", postedImage: [#imageLiteral(resourceName: "image5")])
        Post.posts += [samplePost5]
       
        let samplePost6 = Post.init(postTi: "Volunteers needed!", postDe: "Come to the meeting today at lunch for more information", clubIdentifier: "Student Council", postImage: photo3!, postDa: "2018-08-29", postedImage: [#imageLiteral(resourceName: "image6")])
        Post.posts += [samplePost6]
        
        let samplePost13 = Post.init(postTi: "School Event", postDe: "Come to the meeting today at lunch for more information", clubIdentifier: "School", postImage: photo13!, postDa: "2018-08-27", postedImage: [#imageLiteral(resourceName: "image6")])
        Post.posts += [samplePost13]
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
