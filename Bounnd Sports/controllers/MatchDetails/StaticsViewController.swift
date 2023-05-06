//
//  StaticsViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 03/05/2023.
//

import UIKit

class StaticsViewController: UIViewController {
    
    @IBOutlet var emptyView: UIView!
    var statistics:[StatisticsMatchDetail]?{
        didSet{
            statisticsTableView.reloadData()
            emptyView.isHidden = true
        }
    }
    
    @IBOutlet var statisticsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        statisticsTableView.delegate=self
        statisticsTableView.dataSource=self
        statisticsTableView.register(UINib(nibName: "StatisticsTableViewCellType1", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
}
extension StaticsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statistics?[section].data?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!  StatisticsTableViewCellType1
        cell.configureCell(data: statistics?[indexPath.section].data?[indexPath.row] ?? DataStatistics("{}"))
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return statistics?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return statistics?[section].header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.width / (50/9)
    }
    
}
