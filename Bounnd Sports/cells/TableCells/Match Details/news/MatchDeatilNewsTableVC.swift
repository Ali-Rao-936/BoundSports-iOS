//
//  MatchDeatilNewsTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 04/05/2023.
//

import UIKit

class MatchDeatilNewsTableVC: UITableViewCell {

    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var txtTitle: UILabel!
    @IBOutlet var txtTime: UILabel!
    @IBOutlet var txtSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
      
    }
    
    func configureCell(data:Medias){
        txtTitle.text=data.title
        txtTime.text=data.date
        mediaImage.setImage(with: data.preview, placeholder: Utility.getPlaceHolder())
    }
    
}
