//
//  MoreViewController.swift
//  IDK
//
//  Created by Shir Dayan on 2018-05-01.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class MoreViewController: UITableViewController {
    
    @IBOutlet weak var slideMenu: UIView!
    @IBOutlet weak var slideMenuLeading: NSLayoutConstraint!
    
    var slideMenuShowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Note.loadNotes()
        noteTable = self.tableView
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: Selector(("insertNewObject:")))
        self.navigationItem.rightBarButtonItem = addButton
        slideMenu.layer.shadowOpacity = 1
        slideMenu.layer.shadowRadius = 6
    }
    
    func insertNewObject(sender: AnyObject){
        allNotes.insert(Note(), at: 0)
        let indexPath = NSIndexPath(init(row: 0 section: 0)
        self.tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let object = allNotes[indexPath.row]
        cell.textLabel!.text = object.note
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            allNotes.removeAtIndex(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
            //create a new instance of the appropriate class, insert it into the array, and ass a new row to the table view
        }
    }
    
    @IBAction func slideMenuButton(_ sender: Any) {
        if slideMenuShowing {
            slideMenuLeading.constant = -260
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        } else {
            slideMenuLeading.constant = 0
            UIView.animate(withDuration: 0.4,
                           animations: {
                self.view.layoutIfNeeded()
            })
        }
        slideMenuShowing = !slideMenuShowing
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = allNotes[indexPath.row]
                currentNoteIndex = indexPath.row
            }else{
                currentNoteIndex = 0
            }
        }
    }
    

}
