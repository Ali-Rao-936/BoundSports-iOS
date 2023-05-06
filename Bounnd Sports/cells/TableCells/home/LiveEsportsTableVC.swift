//
//  LiveEsportsTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 25/04/2023.
//

import UIKit

class LiveEsportsTableVC: UITableViewCell {
    

    var liveList : [DataEsports]?{
        didSet{
            collectionView.reloadData()
        }
    }
    

    @IBOutlet var noMatchesLable: UILabel!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        
        collectionView.registerCell(identifier: "LiveEsportsItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LiveEsportsTableVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return liveList?.count ?? 0
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveEsportsItemCollectionVC", for: indexPath) as! LiveEsportsItemCollectionVC
  
            cell.configureCell(data: (liveList?[indexPath.row])!)

            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width - 52) / 2, height: 110)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "MatchDetailsStoryboard", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "EsportsDetailViewController") as! EsportsDetailViewController
        vc.homeTeamLogoString = (liveList?[indexPath.row].homeTeamLogo ?? "")
        vc.awayTeamLogoString = (liveList?[indexPath.row].awayTeamLogo ?? "")
        vc.matchId = liveList?[indexPath.row].id
        if Utility.getCurrentLang() == "cn"{
            vc.leagueName = liveList?[indexPath.row].league?.cnName
        }else{
            vc.leagueName = liveList?[indexPath.row].league?.enName
        }
        self.parentContainerViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
