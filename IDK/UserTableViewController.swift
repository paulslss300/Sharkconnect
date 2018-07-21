//
//  UserTableViewController.swift
//  IDK
//
//  Created by Student on 2018-01-22.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class UserTableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var selectedClub: Club? = nil
    
    // IMPORTANT FEATURE ----- LOG OUT BUTTON
    @IBAction func logOutButton(_ sender: Any) {
        userId = ""
        loggedInClub = nil
        loggedInStudent = nil
        subscribedPosts.removeAll()
        performSegue(withIdentifier: "unwindToFirst", sender: self)
    }
    
    
    @IBOutlet weak var userTableview: UITableView!
    @IBOutlet weak var clubSettingsClub: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableview.delegate  = self
        userTableview.dataSource = self
        
        if userId == "studentRandomNumber10382" {
            clubSettingsClub.isHidden = true
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userTableview.reloadData()
    }
    
    //use these functions to make the navigation controller dissapear on a certain view controller
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if loggedInAsClub {
            return (loggedInClub?.subscribedClubs.count)!
        }
        
        return (loggedInStudent?.subscribedClubs.count)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var club = loggedInStudent?.subscribedClubs[indexPath.row]

        if loggedInAsClub {
            club = loggedInClub?.subscribedClubs[indexPath.row]
        }
        selectedClub = club
        performSegue(withIdentifier: "showclubinformationthroughuser", sender: self)
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userReuseIdentifier", for: indexPath) as! UserTableViewCell
        
        cell.clubImage.layer.cornerRadius = 30.0
        cell.clubImage.layer.masksToBounds = true
        
        var subscribedClub = loggedInStudent?.subscribedClubs[indexPath.row]

        if loggedInAsClub {
            subscribedClub = loggedInClub?.subscribedClubs[indexPath.row]
        }
        
        // Configure the cell...
        cell.clubImage.image = subscribedClub?.ClubCellImageName
        cell.clubName?.text = subscribedClub?.ClubNa


        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    @IBAction func unwindToTabBar(segue: UIStoryboardSegue) {}

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destination as? ClubInformationViewController {
            destinationViewController.selectedClub = selectedClub
        }

    }

}
