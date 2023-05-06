//
//  DtailsLinupItemTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 05/05/2023.
//

import UIKit

class DtailsLinupItemTableVC: UITableViewCell {

    @IBOutlet var nameLable: UILabel!
    @IBOutlet var imgPlayer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: ELineup){
        nameLable.text=data.playerName
        
        let url=data.playerPicUrl?.components(separatedBy: "_file")
        if (url?.count ?? 0) > 1  {
            imgPlayer.setImage(with: BaseUrl.imgBaseURL + (url?[1] ?? "" ) , placeholder: Utility.getPlaceHolder())
        }else{
            imgPlayer.image=UIImage(named: "allLeagues")
        }
      }
}
