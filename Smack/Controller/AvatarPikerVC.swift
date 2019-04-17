//
//  AvatarPikerVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/17/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class AvatarPikerVC: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var imageAvatar : [String] = []
    var avatarselected = AvatarType.dark
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
             cell.configureCell(index: indexPath.item, type: avatarselected )
            return cell
        }
        return AvatarCell()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    @IBOutlet weak var CollictionView: UICollectionView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollictionView.dataSource = self
        CollictionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func BackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfColm : CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numberOfColm = 4
        }
        let spacebetwencells : CGFloat = 10
        let padding : CGFloat = 40
        let celldimentions = ((collectionView.bounds.width - padding ) - (numberOfColm - 1 ) * spacebetwencells) / numberOfColm
    return CGSize(width: celldimentions, height: celldimentions)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarselected == .dark{
            UserDataService.instance.setavatarName(foravatarname: "dark\(indexPath.item)")
        }
        else{
        UserDataService.instance.setavatarName(foravatarname: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            avatarselected = .dark
        }
        else
        {
            avatarselected = .light
        }
        CollictionView.reloadData()
    }
}
