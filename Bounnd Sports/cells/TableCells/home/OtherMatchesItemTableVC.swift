//
//  OtherMatchesItemTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 02/05/2023.
//

import UIKit

class OtherMatchesItemTableVC: UITableViewCell {
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
