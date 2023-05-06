//
//  MatchestitleCollectionVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class MatchestitleCollectionVC: UICollectionViewCell {

    @IBOutlet var imgCategory: UIImageView!
    @IBOutlet var bgView: UIView!
    @IBOutlet var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override var isSelected: Bool{
        didSet{
            handleSelection()
        }
    }

    func handleSelection(){
        if isSelected{
            bgView.backgroundColor = Colors.primaryColor()
            titleLable.textColor = .white
        }else{
            bgView.backgroundColor = .white
            titleLable.textColor = Colors.grayTextColor()
        }
    }
}
