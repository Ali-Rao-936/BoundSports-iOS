//
//  StandingsViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 03/05/2023.
//

import UIKit

class StandingsViewController: UIViewController {

    @IBOutlet var emptyView: UIView!
    @IBOutlet var tableView: UITableView!
    var standings:[StandingsMatchDetail]?{
        didSet{
            tableView.reloadData()
            emptyView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "PlayerStandingsTableVC", bundle: nil), forCellReuseIdentifier: "PlayerStandingsTableVC")
        tableView.register(UINib(nibName: "StandingsHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "StandingsHeaderTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self
       
        
    }

}

extension StandingsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standings?[section].tableData?.count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return standings?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerStandingsTableVC", for: indexPath) as! PlayerStandingsTableVC
    
            cell.standings = standings?[indexPath.section].tableData?[indexPath.row].data ?? []
        
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandingsHeaderTableViewCell") as! StandingsHeaderTableViewCell
        cell.lableTitle.text = standings?[section].name ?? " "
        return cell
    }
    
   
    
}
