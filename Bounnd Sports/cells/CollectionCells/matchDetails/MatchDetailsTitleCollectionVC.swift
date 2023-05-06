//
//  MatchDetailsTitleCollectionVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 03/05/2023.
//

import UIKit

class MatchDetailsTitleCollectionVC: UICollectionViewCell {

    @IBOutlet var viewLine: UIView!
    @IBOutlet var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                viewLine.isHidden = false
            }else{
                viewLine.isHidden = true
            }
        }
    }

}
