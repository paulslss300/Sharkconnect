//
//  CreateNoteViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-05-05.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreateNoteViewController: UIViewController {

    @IBOutlet weak var noteContent: UITextView!
    
    @IBAction func deleteNote(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveNote(_ sender: Any) {
        let newNote = Note(postDe: noteContent.text!)
        noteList += [newNote]
        _ = navigationController?.popViewController(animated: true)     // go back to previous VC
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

/* To do:
 1. display notes using tableview/collectionview in MoreVC
 2. create a structure that is similar to DiscoverVC + ClubInformationVC
 */
