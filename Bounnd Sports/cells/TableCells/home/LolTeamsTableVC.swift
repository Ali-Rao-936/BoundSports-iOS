//
//  LolTeamsTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class LolTeamsTableVC: UITableViewCell {

    var viewmodel=EsportsViewModel()
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewmodel.delegate = self
        viewmodel.getEsportsMatchesFor(esportsType: "102")
        collectionView.registerCell(identifier: "TopTeamsItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LolTeamsTableVC : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.esportsListing?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopTeamsItemCollectionVC", for: indexPath) as! TopTeamsItemCollectionVC
        cell.titleLable.text = viewmodel.esportsListing?[indexPath.row].homeTeamName
        cell.imgTitle.setImage(with: viewmodel.esportsListing?[indexPath.row].homeTeamLogo, placeholder: Utility.getPlaceHolder())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 45)
    }
    
    
}

extension LolTeamsTableVC:EsportsViewModelDelegate{
    func didFinishFetchMatchDetail() {
        
    }
    
    func didFinishEsportsLeaguesFetch() {
        self.collectionView.reloadData()
    }
    
    
    func didFinishEsportsListFetch() {
        self.collectionView.reloadData()
    }
}
