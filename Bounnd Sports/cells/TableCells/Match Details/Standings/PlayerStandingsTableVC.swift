//
//  PlayerStandingsTableVC.swift
//  LiveScore
//
//  Created by Qoo on 27/01/2023.
//

import UIKit

class PlayerStandingsTableVC: UITableViewCell {

    @IBOutlet weak var collectionview: UICollectionView!
    
    var standings:[String]?{
        didSet{
            collectionview.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionview.registerCell(identifier: "PlayerStandingsCollectionVC")
        collectionview.delegate = self
        collectionview.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PlayerStandingsTableVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return standings?.count ?? 0
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerStandingsCollectionVC", for: indexPath) as! PlayerStandingsCollectionVC
        switch (indexPath.row){
        case 0:
            cell.lblTitle.text = standings?[0]
        case 1:
            cell.lblTitle.text = standings?[3]
        case 2:
            cell.lblTitle.text = standings?[4]
        case 3:
            cell.lblTitle.text = standings?[5]
        case 4:
            cell.lblTitle.text = standings?[6]
        case 5:
            cell.lblTitle.text = standings?[7]
        default:
            cell.lblTitle.text = standings?[8]
        }
     //   cell.lblTitle.text = standings?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var width = UIScreen.main.bounds.size.width / 8
//         if(indexPath.row == 1 || indexPath.row == 2){
//             width = width * 1.85
//         }else{
//             width = width * 1.05
//         }
//
//         return CGSize(width: width, height: 40)
        
        var width = UIScreen.main.bounds.size.width / 13
 
        if(indexPath.row == 1){
            width = width * 3.8
        }
         
         return CGSize(width: width, height: 40)
    }
    
}
