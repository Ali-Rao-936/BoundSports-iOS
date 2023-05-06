//
//  MatchNewsViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 03/05/2023.
//

import UIKit

class MatchNewsViewController: UIViewController {

    @IBOutlet var emptyView: UIView!
    var media:[Medias]?{
        didSet{
            tableView.reloadData()
            emptyView.isHidden = true
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "MatchDeatilNewsTableVC", bundle: nil), forCellReuseIdentifier: "MatchDeatilNewsTableVC")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

   

}

extension MatchNewsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media?.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchDeatilNewsTableVC", for: indexPath) as! MatchDeatilNewsTableVC
        cell.configureCell(data: media?[indexPath.row] ?? Medias("{}"))
        return cell
    }
    
    
    
}
