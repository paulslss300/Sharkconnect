//
//  DiscoverViewController.swift
//  IDK
//
//  Created by Student on 2018-02-13.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var discoverView: UICollectionView!
    
    var isSerching: Bool = false
    
    var selectedClub: Club? = nil
    
    var filteredClubs = [Club]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discoverView.delegate  = self
        discoverView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(red: 120/225.0, green: 143/225.0, blue: 170/225.0, alpha: 1)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        discoverView.reloadData()
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var club = clubs[indexPath.row]
        
        if isSerching {
            club = filteredClubs[indexPath.row]
        }
        
        selectedClub = club
        performSegue(withIdentifier: "showclubinformation", sender: self)  
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if isSerching {
            return filteredClubs.count
        }
        
        return clubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discovercells", for: indexPath) as? DiscoverCollectionViewCell {
            
            cell.clubImage.layer.cornerRadius = 50.0
            cell.imageView?.layer.cornerRadius = 50.0
            cell.clubImage.layer.masksToBounds = true
            
            var club = clubs[indexPath.row]
            
            if isSerching {
                club = filteredClubs[indexPath.row]
            }
            
            
            cell.clubName?.text = club.ClubNa
            cell.clubImage.image = club.ClubCellImageName
            
            return cell
            
        } else {
            assertionFailure("Failed to deque cell")
            return UICollectionViewCell()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSerching = false
            discoverView.reloadData()
        } else {
            isSerching = true
            filteredClubs = clubs.filter({$0.ClubNa.lowercased().contains(searchBar.text!.lowercased())})
            discoverView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        self.searchBar.endEditing(true)
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
