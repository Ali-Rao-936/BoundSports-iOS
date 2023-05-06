//
//  LiveEsportsItemCollectionVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 25/04/2023.
//

import UIKit

class LiveEsportsItemCollectionVC: UICollectionViewCell {

    
    @IBOutlet var LiveView: UIView!
    @IBOutlet var awayScore: UILabel!
    @IBOutlet var homeScore: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var tournamentName: UILabel!
    @IBOutlet weak var tournamentLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(data:DataEsports){
        let url=data.league?.logoUrl?.components(separatedBy: "_file")
        if (url?.count ?? 0) > 1  {
            self.tournamentLogo.setImage(with: BaseUrl.imgBaseURL + (url?[1] ?? "" ) , placeholder: Utility.getPlaceHolder())
        }
        if Utility.getCurrentLang() == "cn"{
            tournamentName.text=data.league?.cnName
        }else{
            tournamentName.text=data.league?.enName
        }
        if (data.statusCode ?? "")  == "0"{
            self.LiveView.isHidden=true
        }
        else{
            self.LiveView.isHidden=false
        }
        homeTeamImageView.setImage(with: data.homeTeamLogo, placeholder: Utility.getPlaceHolder())
        awayTeamImageView.setImage(with: data.awayTeamLogo, placeholder: Utility.getPlaceHolder())
        homeScore.text = data.homeTeamScore ?? ""
        awayScore.text = data.awayTeamScore ?? ""
        homeTeamName.text=data.homeTeamName
        awayTeamName.text=data.awayTeamName
    }
    


}
