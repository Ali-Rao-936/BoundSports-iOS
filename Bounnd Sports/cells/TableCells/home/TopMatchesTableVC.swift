//
//  TopMatchesTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 02/05/2023.
//

import UIKit

class TopMatchesTableVC: UITableViewCell {
    
    var category = "hockey"
    @IBOutlet var collectionView: UICollectionView!
    
    var  matchesList : [MatchCategory]?{
        didSet{
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.registerCell(identifier: "TopMatchesItemCollectionVC")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TopMatchesTableVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if matchesList?.count ?? 0 > 4{
            return 4
        }else{
            return matchesList?.count ?? 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopMatchesItemCollectionVC", for: indexPath) as! TopMatchesItemCollectionVC
  
        cell.configureCell(data: (matchesList?[indexPath.row])!, league: HomeViewController.leagueList[indexPath.row])

            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width - 52) / 2, height: 110)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "MatchDetailsStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MatchDetailsViewController") as! MatchDetailsViewController
        vc.matchSlug = matchesList?[indexPath.row].slug
        vc.game = category
        self.parentContainerViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
