//
//  OtherMatchesTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 02/05/2023.
//

import UIKit

class OtherMatchesTableVC: UITableViewCell {
    
    var category = "hockey"
    @IBOutlet var noMatches: UILabel!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    var tableViewStandingsObserver: NSKeyValueObservation?
    
    var  matchesList : [MatchCategory]?{
        didSet{
            if matchesList?.count ?? 0 < 5 {
                noMatches.isHidden = false
                tableView.isHidden = true
            }else{
                noMatches.isHidden = true
                tableView.isHidden = false
                tableView.reloadData()
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableViewStandingsObserver = tableView.observe(\.contentSize, options: .new) { (_, change) in
            guard let height = change.newValue?.height else { return }
            self.tableViewHeight.constant = height
        }
        
        tableView.register(UINib(nibName: "OtherMatchesItemTableVC", bundle: nil), forCellReuseIdentifier: "OtherMatchesItemTableVC")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension OtherMatchesTableVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (matchesList?.count ?? 0) - 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherMatchesItemTableVC") as! OtherMatchesItemTableVC
        cell.configureCell(data: (matchesList?[indexPath.row + 4])!, league: HomeViewController.leagueList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "MatchDetailsStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MatchDetailsViewController") as! MatchDetailsViewController
        vc.matchSlug = matchesList?[indexPath.row + 4].slug
        vc.game = category
        self.parentContainerViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
