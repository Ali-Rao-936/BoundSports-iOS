//
//  EsportsDetailScoreTableViewCell.swift
//  Shoot Sports
//
//  Created by Yahya on 3/22/23.
//

import UIKit

class EsportsDetailScoreTableViewCell: UITableViewCell {

   
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    func configureCell(data:Scores,homeTeamName:String,awayTeamName:String,homeTeamLogo:String,awayTeamLogo:String){
        self.homeTeamLogo.setImage(with: homeTeamLogo, placeholder: Utility.getPlaceHolder())
        self.awayTeamLogo.setImage(with: awayTeamLogo, placeholder: Utility.getPlaceHolder())
        self.awayTeamLogo.cornerRadius = self.awayTeamLogo.bounds.height / 2
        self.homeTeamLogo.cornerRadius = self.homeTeamLogo.bounds.height / 2
        
        self.scoreLabel.text=(data.team1 ?? "0") + " : " + (data.team2
                                                            ?? "0")
        self.homeTeamName.text=homeTeamName
        self.awayTeamName.text=awayTeamName
        
        self.titleLable.text = data.type
    }
    
}
