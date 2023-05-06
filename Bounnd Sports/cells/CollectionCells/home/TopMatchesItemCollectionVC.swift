//
//  TopMatchesItemCollectionVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 02/05/2023.
//

import UIKit

class TopMatchesItemCollectionVC: UICollectionViewCell {
    

    @IBOutlet var awayScore: UILabel!
    @IBOutlet var homeScore: UILabel!
    @IBOutlet var homeTeamName: UILabel!
    @IBOutlet var awayTeamName: UILabel!
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var leagueName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(data:MatchCategory, league : String){

//        if Utility.getCurrentLang() == "cn"{
//            tournamentName.text=data.league?.cnName
//        }else{
//            tournamentName.text=data.league?.enName
//        }
//
        
        leagueName.text = league

        if data.matchState == "notstarted"{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Utility.dateFormat.hhmm2.rawValue
            
            let tim = Utility.formatDate(date: dateFormatter.date(from: data.time ?? ""), with: .hhmma)
            timeLable.text = "Today, \(tim)"
            timeLable.textColor = .black
         //   timeLable.text = data.time
        }else{
            timeLable.textColor = .red
            timeLable.text = data.matchState
        }
        homeScore.text = data.homeScore ?? "0"
        awayScore.text = data.awayScore ?? "0"
        homeTeamName.text=data.homeTeam
        awayTeamName.text=data.awayTeam
    }

}
