//
//  DiscoverTableViewController.swift
//  IDK
//
//  Created by Student on 2018-02-06.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class DiscoverTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var discoverTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discoverTableView.delegate  = self
        discoverTableView.dataSource = self
        
        // Load the sample data.
        loadSampleClubs()
    }
    
    
    
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
        // #warning Incomplete implementation, return the number of rows
        return ClubCell.clubcells.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DiscoverTableViewCell = tableView.dequeueReusableCell(withIdentifier: "discoveryReuseIdentifier", for: indexPath) as! DiscoverTableViewCell

        let clubcell = ClubCell.clubcells[indexPath.row]
        
        // Configure the cell...
        cell.clubCellLabel?.text = clubcell.ClubCellTi

        return cell
    }
    
    
    private func loadSampleClubs() {
        
        // Populate Clubs
        let clubcell1 = ClubCell(ClubCellTi: "Drama Club")
        ClubCell.clubcells += [clubcell1]
        
        let clubcell2 = ClubCell(ClubCellTi: "Interact Club")
        ClubCell.clubcells += [clubcell2]
        
        let clubcell3 = ClubCell(ClubCellTi: "Student Council")
        ClubCell.clubcells += [clubcell3]
        
        let clubcell4 = ClubCell(ClubCellTi: "Art Club")
        ClubCell.clubcells += [clubcell4]
        
        let clubcell5 = ClubCell(ClubCellTi: "STEM Club")
        ClubCell.clubcells += [clubcell5]
        
        let clubcell6 = ClubCell(ClubCellTi: "Math Club")
        ClubCell.clubcells += [clubcell6]
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
