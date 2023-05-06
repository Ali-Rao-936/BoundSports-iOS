//
//  MatchDetailsViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 01/05/2023.
//

import UIKit

class MatchDetailsViewController: UIViewController {
    
    var titles = ["Info","Standings","Lineup","Statistics","News"]
    
    var infoVc : InfoViewController?
    var standingVc : StandingsViewController?
    var eventsVc : EventsViewController?
    var lineupVc : LineupViewController?
    var staticsVc : StaticsViewController?
    var newsVc : MatchNewsViewController?
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var newsView: UIView!
    @IBOutlet var staticsView: UIView!
    @IBOutlet var lineupView: UIView!
    @IBOutlet var standingsView: UIView!
    @IBOutlet var eventsView: UIView!
    @IBOutlet var infoView: UIView!
    @IBOutlet var awayName: UILabel!
    @IBOutlet var homeName: UILabel!
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var scoreLable: UILabel!
    @IBOutlet var imgAway: UIImageView!
    @IBOutlet var imgHome: UIImageView!
    @IBOutlet var leagueName: UILabel!
    
    
    var viewmodel=MatchDetailViewModel()
    var matchSlug:String?
    var selectedIndex=0
    var isFootball=false
    var game:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackButton()
        setupNavBar(name: "Match Detail")
        Utility.showProgress()
        viewmodel.delegate=self
        viewmodel.getMatchDetails(slug: matchSlug ?? "",game: game ?? "")
        
        collectionView.registerCell(identifier: "MatchDetailsTitleCollectionVC")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        controlViews()
        infoView.isHidden = false
        
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
    }
    
    func controlViews(){
        infoView.isHidden = true
        eventsView.isHidden = true
        standingsView.isHidden = true
        lineupView.isHidden = true
        staticsView.isHidden = true
        newsView.isHidden = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    switch segue.identifier {
      
        case "statistics_segue" :
            staticsVc = segue.destination as? StaticsViewController
        case "event_segue" :
            eventsVc = segue.destination as? EventsViewController
        case "info_segue" :
            infoVc = segue.destination as? InfoViewController
        case "news_segue" :
            newsVc = segue.destination as? MatchNewsViewController
        case "standing_segue" :
            standingVc = segue.destination as? StandingsViewController
        case "lineup_segue" :
            lineupVc = segue.destination as? LineupViewController
    
        default:
            print("TAG default")
        }
           
        }

}

extension MatchDetailsViewController:MatchDetailViewModelDelegate{
    func didFinishFetchMatchDetail() {
        
        leagueName.text=viewmodel.matchDetail?.data?.leagueName
        imgHome.setImage(with: viewmodel.matchDetail?.data?.homeTeamImage, placeholder: Utility.getPlaceHolder())
        imgAway.setImage(with: viewmodel.matchDetail?.data?.awayTeamImage, placeholder: Utility.getPlaceHolder())
        scoreLable.text=(viewmodel.matchDetail?.data?.homeScore ?? "0")  + " : " + (viewmodel.matchDetail?.data?.awayScore ?? "0")
        homeName.text=viewmodel.matchDetail?.data?.homeTeamName
        awayName.text=viewmodel.matchDetail?.data?.awayTeamName
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.yyyyMMddHHmmss.rawValue
        
        let tim = Utility.formatDate(date: dateFormatter.date(from: viewmodel.matchDetail?.data?.matchDatetime ?? ""), with: .hhmma)
        timeLable.text = "Today, \(tim)"
        
        // update values for every container
        infoVc?.data = viewmodel.matchDetail?.data
        if viewmodel.matchDetail?.data?.standings?.count ?? 0 > 0{
            standingVc?.standings = viewmodel.matchDetail?.data?.standings
        }
        if viewmodel.matchDetail?.data?.homeLineup?.playerMain?.count ?? 0 > 0{
            lineupVc?.matchDetail = viewmodel.matchDetail
            lineupVc?.homeName.text = viewmodel.matchDetail?.data?.homeTeamName
            lineupVc?.awayName.text = viewmodel.matchDetail?.data?.awayTeamName
        }
        
        if viewmodel.matchDetail?.data?.statistics?.count ?? 0 > 0 {
            staticsVc?.statistics = viewmodel.matchDetail?.data?.statistics
        }
        if viewmodel.matchDetail?.data?.medias?.count ?? 0 > 0 {
            newsVc?.media = viewmodel.matchDetail?.data?.medias
        }
    }
    
}


extension MatchDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchDetailsTitleCollectionVC", for: indexPath) as! MatchDetailsTitleCollectionVC
        cell.titleLable.text = titles[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 80, height: 38)
        }else{
            return CGSize(width: 110, height: 38)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.row){
        case 0:
            controlViews()
            infoView.isHidden = false
        case 1:
            controlViews()
            standingsView.isHidden = false
        case 2:
            controlViews()
            lineupView.isHidden = false
        case 3:
            controlViews()
            staticsView.isHidden = false
        default:
            controlViews()
            newsView.isHidden = false
            
        }
    }
    
}
