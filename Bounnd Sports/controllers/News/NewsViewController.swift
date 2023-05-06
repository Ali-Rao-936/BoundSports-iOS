//
//  NewsViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class NewsViewController: UIViewController , HomeViewModelDelegate {
    func didFinishFetchNews() {
        
    }
    
    func didFinishFetchCategories() {
        
    }
    
    func didFinishFetchVideos() {
        if page < 5 {
            page = page + 1
            view_model.getVideos(page: page)
        }else{
            
         //   let indexPath = IndexPath(item: 0, section: 0)
            self.tableView.reloadRows(at: [ IndexPath(item: 0, section: 2)], with: .none)
        }
    }
   
    var view_model = HomeViewModel()
    @IBOutlet var tableView: UITableView!
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view_model.delegate = self
        view_model.getVideos(page: page)
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TopNewsTableVC", bundle: nil), forCellReuseIdentifier: "TopNewsTableVC")
        tableView.register(UINib(nibName: "MoreNewsTableVC", bundle: nil), forCellReuseIdentifier: "MoreNewsTableVC")
        tableView.register(UINib(nibName: "NewsHighlightsTableVC", bundle: nil), forCellReuseIdentifier: "NewsHighlightsTableVC")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupNavBar(name: "News & Highlights")
    }

}

extension NewsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopNewsTableVC") as! TopNewsTableVC
            
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoreNewsTableVC") as! MoreNewsTableVC
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsHighlightsTableVC") as! NewsHighlightsTableVC
            cell.view_model = self.view_model
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return 185
        default:
            return CGFloat(((view_model.videoList?.count ?? 2) / 2) * 140)
        }
    }
    
}
