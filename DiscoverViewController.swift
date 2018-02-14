//
//  DiscoverViewController.swift
//  IDK
//
//  Created by Student on 2018-02-13.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    @IBOutlet weak var discoverView: UICollectionView!
    
    var selectedClub: Club? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width/2 - 50
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 30, 10, 30)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        discoverView.collectionViewLayout = layout
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let club = Club.clubs[indexPath.row]
        selectedClub = club
        performSegue(withIdentifier: "showclubinformation", sender: self)  
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Club.clubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discovercells", for: indexPath) as! DiscoverCollectionViewCell
        let club = Club.clubs[indexPath.row]
        cell.clubName?.text = club.ClubNa
        cell.clubImage.image = club.ClubCellImageName
        
        return cell
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destination as? ClubInformationViewController {
            destinationViewController.selectedClub = selectedClub
        }
    }
    

}
