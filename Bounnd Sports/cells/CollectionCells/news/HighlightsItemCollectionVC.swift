//
//  HighlightsItemCollectionVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class HighlightsItemCollectionVC: UICollectionViewCell {

    @IBOutlet var dateLable: UILabel!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var imgTitle: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(obj:VideoList?){
        let dateFormatter = DateFormatter()
       
        titleLable.text = obj?.title
        imgTitle.setImage(with: obj?.thumbnailPath, placeholder: Utility.getPlaceHolder())
        dateLable.text = Utility.formatDate(date: dateFormatter.date(from: obj?.createTime ?? ""), with: .ddMMMyyyy)
    }
}
