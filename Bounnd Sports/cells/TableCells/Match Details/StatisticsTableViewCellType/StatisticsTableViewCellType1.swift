//
//  StatisticsTableViewCellType1.swift
//  Shoot Sports
//
//  Created by Yahya on 3/28/23.
//

import UIKit

class StatisticsTableViewCellType1: UITableViewCell {

    @IBOutlet weak var awayPercentLabel: UILabel!
    @IBOutlet weak var homePercentLabel: UILabel!
    @IBOutlet weak var progressBarWifth: NSLayoutConstraint!
    @IBOutlet weak var progressbarTinted: UIView!
    @IBOutlet weak var backgroundContainer: UIView!
    @IBOutlet weak var statisticName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureCell(data:DataStatistics){
        var homeValueString = "0"
        var awayValueString = "0"
        statisticName.text = data.key
        homePercentLabel.text = data.homeValue
        awayPercentLabel.text = data.awayValue
        if (data.homeValue?.contains("%") ?? false) && (data.awayValue?.contains("%") ?? false){
            if (data.homeValue?.components(separatedBy: "%").count ?? 0) > 0{
                homeValueString=data.homeValue?.components(separatedBy: "%")[0] ?? "0"
            }
            if (data.awayValue?.components(separatedBy: "%").count ?? 0) > 0{
                 awayValueString=data.awayValue?.components(separatedBy: "%")[0] ?? "0"
            }
            let homeValue:Int=Int(homeValueString) ?? 0
            let awayValue:Int=Int(awayValueString) ?? 0
            
            let percentageForProgressBar=backgroundContainer.bounds.width * CGFloat(Float(awayValue) / Float(100))
            progressBarWifth.constant=percentageForProgressBar
            if homeValue > awayValue{
                progressbarTinted.backgroundColor = .lightGray
                backgroundContainer.backgroundColor = Colors.primaryColor()
                homePercentLabel.textColor = .white
                awayPercentLabel.textColor = .black
            }else{
                progressbarTinted.backgroundColor =  Colors.primaryColor()
                backgroundContainer.backgroundColor = .lightGray
                homePercentLabel.textColor = .black
                awayPercentLabel.textColor = .white
            }
        }
        else if (!(data.homeValue?.contains("(") ?? false) ) && (!(data.awayValue?.contains("(") ?? false)){
            let homeValue:Int=Int(data.homeValue ?? "0") ?? 0
            let awayValue:Int=Int(data.awayValue ?? "0") ?? 0
            let sum=homeValue+awayValue
            if sum == 0{
                return
            }
            let homePercentage=(Float(homeValue)/Float(sum))
            let awayPercentage=(Float(awayValue)/Float(sum))
            let percentageForProgressBar=backgroundContainer.bounds.width * CGFloat(Float(awayPercentage))
            progressBarWifth.constant=percentageForProgressBar
            
            if homeValue > awayValue{
                progressbarTinted.backgroundColor = .lightGray
                backgroundContainer.backgroundColor = Colors.primaryColor()
                homePercentLabel.textColor = .white
                awayPercentLabel.textColor = .black
            }else{
                progressbarTinted.backgroundColor =  Colors.primaryColor()
                backgroundContainer.backgroundColor = .lightGray
                homePercentLabel.textColor = .black
                awayPercentLabel.textColor = .white
            }
            
        }else{
            
            if (data.homeValue?.components(separatedBy: "%").count ?? 0) > 0{
                homeValueString=data.homeValue?.components(separatedBy: "%")[0] ?? "0"
            }
            if (data.awayValue?.components(separatedBy: "%").count ?? 0) > 0{
                 awayValueString=data.awayValue?.components(separatedBy: "%")[0] ?? "0"
            }
            let homeValue:Int=Int(homeValueString) ?? 0
            let awayValue:Int=Int(awayValueString) ?? 0
            
            let percentageForProgressBar=backgroundContainer.bounds.width * CGFloat(Float(awayValue) / Float(100))
            progressBarWifth.constant=percentageForProgressBar
            if homeValue > awayValue{
                progressbarTinted.backgroundColor = .lightGray
                backgroundContainer.backgroundColor = Colors.primaryColor()
                homePercentLabel.textColor = .white
                awayPercentLabel.textColor = .black
            }else{
                progressbarTinted.backgroundColor =  Colors.primaryColor()
                backgroundContainer.backgroundColor = .lightGray
                homePercentLabel.textColor = .black
                awayPercentLabel.textColor = .white
            }
        }
        
            
       
        
        
        
    }

   
    
}
