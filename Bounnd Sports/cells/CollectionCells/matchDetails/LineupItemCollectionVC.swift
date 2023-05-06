//
//  LineupItemCollectionVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 04/05/2023.
//

import UIKit

class LineupItemCollectionVC: UICollectionViewCell {
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(data:[String]){
        playerName.text=data[3]
        age.text=data[5]
        position.text=data[4]
        playerImage.setImage(with: data[2], placeholder: Utility.getPlaceHolder())
    }

}
