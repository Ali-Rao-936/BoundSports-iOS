//
//  EsportsGamesTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class EsportsGamesTableVC: UITableViewCell {

    var gamesList:[GameTypeModel]?
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        populateGameTypes()
        collectionView.registerCell(identifier: "EsportsGameItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateGameTypes(){
        gamesList=[]
        //gamesList?.append(GameTypeModel(id: "0", name: "All Games".localized, image: "AllGamesIcon"))
        gamesList?.append(GameTypeModel(id: "101", name: "CS:GO".localized, image: "CsGoIcon"))
        gamesList?.append(GameTypeModel(id: "102", name: "LOL".localized, image: "LoLIcon"))
        gamesList?.append(GameTypeModel(id: "103", name: "Honor Of Kings".localized, image: "honorofKingIcon"))
        gamesList?.append(GameTypeModel(id: "104", name: "DOTA 2".localized, image: "Dota2Icon"))
        gamesList?.append(GameTypeModel(id: "105", name: "HearthStone: Heroes Of Warcraft".localized, image: "WarcraftIcon"))
        gamesList?.append(GameTypeModel(id: "106", name: "Hero Storm".localized, image: "HeroStormIcon"))
        gamesList?.append(GameTypeModel(id: "107", name: "Overwatch".localized, image: "OverwatchIcon"))
        gamesList?.append(GameTypeModel(id: "108", name: "Starcraft".localized, image: "StarcraftIcon"))
        gamesList?.append(GameTypeModel(id: "109", name: "Starcraft 2".localized, image: "Starcraft2Icon"))
        gamesList?.append(GameTypeModel(id: "110", name: "Rocket League".localized, image: "RocketLeagueIcon"))
        gamesList?.append(GameTypeModel(id: "111", name: "Warcraft 3".localized, image: "Warcraft3Icon"))
    }
}

extension EsportsGamesTableVC : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gamesList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EsportsGameItemCollectionVC", for: indexPath) as! EsportsGameItemCollectionVC
        cell.titleLable.text = gamesList![indexPath.row].name
        cell.imgCategory.image = UIImage(named: gamesList![indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 45)
    }
    
    
}
