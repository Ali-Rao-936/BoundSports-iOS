//
//  StandingsHeaderTableViewCell.swift
//  LiveScore
//
//  Created by Qoo on 27/01/2023.
//

import UIKit

class StandingsHeaderTableViewCell: UITableViewCell {

    @IBOutlet var lableTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var headings = ["#","Team Name".localized,"P","W","L","PTs", "OTS"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.registerCell(identifier: "StandingsCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension StandingsHeaderTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        headings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StandingsCollectionViewCell", for: indexPath)
        as! StandingsCollectionViewCell
        
        switch indexPath.row{
        case 0:
            cell.titleLable.text = headings[0]
        case 1:
            cell.titleLable.text = headings[1]
        case 2:
            cell.titleLable.text = headings[2]
        case 3:
            cell.titleLable.text = headings[3]
        case 4:
            cell.titleLable.text = headings[4]
        case 5:
            cell.titleLable.text = headings[5]
        case 6:
            cell.titleLable.text = headings[6]
        default :do {
            
        }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = UIScreen.main.bounds.size.width / 13
 
        if(indexPath.row == 1){
            width = width * 3.8
        }
         
         return CGSize(width: width, height: 40)
        
    }
    
  
    
}
