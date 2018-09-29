//
//  SelectSchoolViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-08-27.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class SelectSchoolViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var schoolTable: UITableView!
    
    var selectedSchool: School? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        schoolTable.delegate = self
        schoolTable.dataSource = self
    }
    /*
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Load and login using stored username and password
        
        let keychain = KeychainSwift()
        
        guard let username = keychain.get("username") else {
            return
        }
        
        guard let password = keychain.get("password") else {
            return
        }
        
        guard let loggedInState = UserDefaults.standard.object(forKey: "loggedInState") as? Bool else {
            return
        }
        
        logIn(username: username, password: password, loggedInState: loggedInState)
    }

    
    func logIn(username: String, password: String, loggedInState: Bool) {
        
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
                    return
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
                performSegue(withIdentifier: "autoLogin", sender: self)
                
            }
            
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
                    return
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
                performSegue(withIdentifier: "autoLogin", sender: self)
                
            }
            
            /////////////////////////////////////////////////////////////////////////

        }

    }
 
     */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let school = schools[indexPath.row]

        selectedSchool = school
        performSegue(withIdentifier: "schoolSelected", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: SelectSchoolTableViewCell = tableView.dequeueReusableCell(withIdentifier: "selectSchoolReuseIdentifier", for: indexPath) as? SelectSchoolTableViewCell {
            
            cell.schoolImage.layer.cornerRadius = 30.0
            cell.schoolImage.layer.masksToBounds = true
            
            let displaySchools = schools[indexPath.row]
            
            // Configure the cell...
            cell.schoolImage.image = displaySchools.SchoolImage
            cell.schoolNa.text = displaySchools.SchoolNa
            
            return cell
            
        } else {
            assertionFailure("Unable to deque cell")
            return UITableViewCell()
        }
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? FirstViewController {
            destinationViewController.selectedSchool = selectedSchool
        }

    }
    

}
