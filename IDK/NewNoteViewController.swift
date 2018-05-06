//
//  NewNoteViewController.swift
//  IDK
//
//  Created by Shir Dayan on 2018-05-04.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet var tView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tView.text = allNotes[currentNoteIndex].note
        //makes the keyboard appear
        tView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if tView.text == "" {
            allNotes.removeAtIndex(currentNoteIndex)
        }
        else{
            allNotes[currentNoteIndex].note = tView.text
        }
        Note.saveNotes()
        noteTable?.reloadData()
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
