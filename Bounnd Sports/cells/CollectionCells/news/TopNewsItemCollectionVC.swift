//
//  TopNewsItemCollectionVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class TopNewsItemCollectionVC: UICollectionViewCell {

    @IBOutlet weak var news_image: UIImageView!
    
    @IBOutlet weak var title_lbl: UILabel!
    @IBOutlet weak var date_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    }
    func configration(news_detail:NewsList?){
      if  let new_details = news_detail {
          news_image.setImage(with: new_details.path, placeholder: Utility.getPlaceHolder())
          title_lbl.text = new_details.title
          
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyyWithTimeZone.rawValue
          
          date_lbl.text = Utility.formatDate(date: dateFormatter.date(from: new_details.createTime ?? ""), with: .ddMMMyyyy)

      }
    }
}
