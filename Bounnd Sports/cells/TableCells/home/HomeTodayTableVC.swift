//
//  HomeTodayTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class HomeTodayTableVC: UITableViewCell {

    var otherList : [DataEsports]?{
        didSet{
            tableView.reloadData()
        }
    }
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    var tableViewStandingsObserver: NSKeyValueObservation?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableViewStandingsObserver = tableView.observe(\.contentSize, options: .new) { (_, change) in
            guard let height = change.newValue?.height else { return }
            self.tableViewHeight.constant = height
        }
        
        // Initialization code
        tableView.register(UINib(nibName: "HomeMtchesItemTableVC", bundle: nil), forCellReuseIdentifier: "HomeMtchesItemTableVC")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeTodayTableVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otherList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMtchesItemTableVC") as! HomeMtchesItemTableVC
        cell.configureCell(data: (otherList?[indexPath.row])!)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "MatchDetailsStoryboard", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "EsportsDetailViewController") as! EsportsDetailViewController
        vc.homeTeamLogoString = (otherList?[indexPath.row].homeTeamLogo ?? "")
        vc.awayTeamLogoString = (otherList?[indexPath.row].awayTeamLogo ?? "")
        if Utility.getCurrentLang() == "cn"{
            vc.leagueName = otherList?[indexPath.row].league?.cnName
        }else{
            vc.leagueName = otherList?[indexPath.row].league?.enName
        }
        vc.matchId = otherList?[indexPath.row].id
        self.parentContainerViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
