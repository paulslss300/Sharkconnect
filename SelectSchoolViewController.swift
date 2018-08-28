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
