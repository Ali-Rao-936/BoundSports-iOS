//
//  MatchesViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class MatchesViewController: UIViewController {

    
   
    var viewmodel=EsportsViewModel()
    var gamesList:[GameTypeModel]?
    
    var isAllGames = true
    var page = "1"
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var titleCollectionView: UICollectionView!
    
    var titles = ["All", "Today", "Finished", "Upcoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utility.showProgress()
        self.populateGameTypes()
        viewmodel.delegate=self
        viewmodel.getAllEsportsMatches(page: page)
    
        
        
        titleCollectionView.registerCell(identifier: "MatchestitleCollectionVC")
        
        titleCollectionView.delegate = self
        titleCollectionView.dataSource = self
        
       
        
        tableView.register(UINib(nibName: "HomeMtchesItemTableVC", bundle: nil), forCellReuseIdentifier: "HomeMtchesItemTableVC")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        titleCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .right)
        
       
    }
    
    func populateGameTypes(){
        gamesList=[]
        gamesList?.append(GameTypeModel(id: "0", name: "All Games".localized, image: "AllGamesIcon"))
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

extension MatchesViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return self.gamesList?.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchestitleCollectionVC", for: indexPath) as! MatchestitleCollectionVC
            cell.titleLable.text = gamesList![indexPath.row].name
            cell.imgCategory.image = UIImage(named: gamesList![indexPath.row].image)
        
            return cell

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        Utility.showProgress()
            if indexPath.row == 0{
                isAllGames = true
                viewmodel.getAllEsportsMatches(page: page)
            }else{
                isAllGames = false
                viewmodel.getEsportsMatchesFor(esportsType: gamesList![indexPath.row].id)
            }
    }
    
    
}

extension MatchesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.esportsListing?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMtchesItemTableVC") as! HomeMtchesItemTableVC
        cell.configureCell(data: viewmodel.esportsListing?[indexPath.row] ?? DataEsports("{}"))
        
        if isAllGames {
            if indexPath.row == (viewmodel.esportsListing?.count ?? 0) - 1{
                var p = Int(page)
                p = (p ?? 1) + 1
                viewmodel.getAllEsportsMatches(page: "\(p ?? 1)")
            }
        }
        
        return cell
    }
    
    
}

extension MatchesViewController:EsportsViewModelDelegate{
    func didFinishFetchMatchDetail() {
        
    }
    
    func didFinishEsportsLeaguesFetch() {
        self.tableView.reloadData()
    }
    
    
    func didFinishEsportsListFetch() {
        self.tableView.reloadData()
    }
}
