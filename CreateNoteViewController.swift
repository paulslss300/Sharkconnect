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
    
    var selectedNote: Note? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteContent.text = selectedNote?.noteDe
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteNote(_ sender: Any) {
        for note in noteList {
            if (selectedNote?.timeCreated)! == note.timeCreated {
                noteList = noteList.filter({ (note) -> Bool in
                    return !(note.timeCreated == selectedNote?.timeCreated)
                })
            }
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveNote(_ sender: Any) {
        selectedNote?.noteDe = noteContent.text
        _ = navigationController?.popViewController(animated: true)     // go back to previous VC
        
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
 3. save when the user leave createNoteVC, also save when the user presses save
 4. add time to Note, use time as an identifier
 */
