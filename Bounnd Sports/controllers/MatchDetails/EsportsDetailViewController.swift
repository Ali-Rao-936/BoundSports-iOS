//
//  EsportsDetailViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 05/05/2023.
//

import UIKit

class EsportsDetailViewController: UIViewController {

    @IBOutlet var status: UILabel!
    @IBOutlet var lineupView: UIView!
    @IBOutlet var lineupTableView: UITableView!
    @IBOutlet var awayLable: UILabel!
    @IBOutlet var awayView: UIView!
    @IBOutlet var homeLable: UILabel!
    @IBOutlet var homeView: UIView!
    @IBOutlet var scoreTableView: UITableView!
    @IBOutlet var txtLineUp: UILabel!
    @IBOutlet var linupView: UIView!
    @IBOutlet var txtScore: UILabel!
    @IBOutlet var scoreView: UIView!
    @IBOutlet var awayScore: UILabel!
    @IBOutlet var homeScore: UILabel!
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var scoreLable: UILabel!
    @IBOutlet var imgAway: UIImageView!
    @IBOutlet var imgHome: UIImageView!
    @IBOutlet var leagueNam: UILabel!
    
    var homeLineup:[ELineup]=[]
    var awayLineup:[ELineup]=[]
    
    var viewmodel=EsportsViewModel()
    var matchId:String?
    var homeTeamLogoString:String?
    var awayTeamLogoString:String?
    var leagueName:String?
    var isHomeLineup = true
    var isScoreDisplayed=true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackButton()
        setupNavBar(name: "Match Details")
        viewmodel.getEsportsMatchDetail(matchID: matchId ?? "0")
       // viewmodel.getEsportsMatchDetail(matchID: "8587444")
        viewmodel.delegate=self
        
        scoreView.setOnClickListener {
            self.isScoreDisplayed = true
            self.scoreView.backgroundColor = Colors.primaryColor()
            self.linupView.backgroundColor =  .white
            self.txtScore.textColor = .white
            self.txtLineUp.textColor = .black
            self.lineupView.isHidden = true
        }
        
        linupView.setOnClickListener {
            self.isScoreDisplayed = false
            self.lineupView.isHidden = false
            self.scoreView.backgroundColor = .white
            self.linupView.backgroundColor =  Colors.primaryColor()
            self.txtScore.textColor = .black
            self.txtLineUp.textColor = .white
            self.lineupTableView.reloadData()
        }
        
        homeView.setOnClickListener {
            self.isHomeLineup = true
            self.homeView.backgroundColor = Colors.primaryColor()
            self.awayView.backgroundColor =  .white
            self.homeLable.textColor = .white
            self.awayLable.textColor = .black
            self.lineupTableView.reloadData()
        }
        
        awayView.setOnClickListener {
            self.isHomeLineup = false
            self.homeView.backgroundColor = .white
            self.awayView.backgroundColor =  Colors.primaryColor()
            self.homeLable.textColor = .black
            self.awayLable.textColor = .white
            self.lineupTableView.reloadData()
        }
        
        
        scoreTableView.register(UINib(nibName: "EsportsDetailScoreTableViewCell", bundle: nil), forCellReuseIdentifier: "EsportsDetailScoreTableViewCell")
        lineupTableView.register(UINib(nibName: "DtailsLinupItemTableVC", bundle: nil), forCellReuseIdentifier: "DtailsLinupItemTableVC")
        
        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        
        lineupTableView.delegate = self
        lineupTableView.dataSource = self
        
        
    }

}
extension EsportsDetailViewController:EsportsViewModelDelegate{
    func didFinishEsportsListFetch() {
        
    }
    
    func didFinishEsportsLeaguesFetch() {
        
    }
    
    func didFinishFetchMatchDetail() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.yyyyMMddHHmmss.rawValue
        
       // let tim = Utility.formatDate(date: dateFormatter.date(from: viewmodel.matchDetail?.matchTime ?? ""), with: .ddMMyyyyWithTimeZone)
       // timeLable.text = "Today, \(tim)"
        leagueNam.text = leagueName
        status.text=viewmodel.matchDetail?.statusName
        homeScore.text=viewmodel.matchDetail?.homeTeamName
        homeLable.text=viewmodel.matchDetail?.homeTeamName
        awayScore.text=viewmodel.matchDetail?.awayTeamName
        awayLable.text=viewmodel.matchDetail?.awayTeamName
        imgHome.setImage(with: homeTeamLogoString, placeholder: Utility.getPlaceHolder())
        imgAway.setImage(with: awayTeamLogoString, placeholder: Utility.getPlaceHolder())
        scoreLable.text=(viewmodel.matchDetail?.homeTeamScore ?? "0") + " : " + (viewmodel.matchDetail?.awayTeamScore ?? "0")
        self.scoreTableView.reloadData()
        sortLineup()
    }
    func sortLineup(){
        let homeTeamId=viewmodel.matchDetail?.homeTeamId
        viewmodel.matchDetail?.lineup?.forEach({element in
            if homeTeamId == element.teamId{
                self.homeLineup.append(element)
            }else{
                self.awayLineup.append(element)
            }
        })
       
    }
}


extension EsportsDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isScoreDisplayed {
         return viewmodel.matchDetail?.scores?.count ?? 0
        } else{
            if isHomeLineup{
                return homeLineup.count
            }else{
                return awayLineup.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isScoreDisplayed{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EsportsDetailScoreTableViewCell", for: indexPath) as! EsportsDetailScoreTableViewCell
            cell.configureCell(data: viewmodel.matchDetail?.scores?[indexPath.row] ?? Scores("{}"), homeTeamName: viewmodel.matchDetail?.homeTeamName ?? "", awayTeamName: viewmodel.matchDetail?.awayTeamName ?? "", homeTeamLogo: homeTeamLogoString ?? "" , awayTeamLogo: awayTeamLogoString ?? "" )
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DtailsLinupItemTableVC", for: indexPath) as! DtailsLinupItemTableVC
            if isHomeLineup{
                cell.configureCell(data: homeLineup[indexPath.row])
            } else{
                cell.configureCell(data: awayLineup[indexPath.row])
            }
            return cell
        }
    }
    
    
    
}
