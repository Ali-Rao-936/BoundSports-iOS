//
//  MoreNewsTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class MoreNewsTableVC: UITableViewCell, HomeViewModelDelegate {
    func didFinishFetchVideos() {
        
    }
    func didFinishFetchNews() {
        collectionView.reloadData()
    }
    
    func didFinishFetchCategories() {
        
    }
    

    var view_model = HomeViewModel()
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var seeMore: UILabel!
    @IBOutlet var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        view_model.delegate = self
        view_model.getNews2(page: 2)
        collectionView.registerCell(identifier: "NewsItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        seeMore.setOnClickListener {
            self.parentContainerViewController()?.openVC(storyBoard: "Main", identifier: "NewsListViewController")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MoreNewsTableVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return view_model.newsList2?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsItemCollectionVC", for: indexPath) as! NewsItemCollectionVC
        cell.configration(news_detail: view_model.newsList2?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 210, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NewsDetailsViewController.newsList = view_model.newsList2
        NewsDetailsViewController.news = view_model.newsList2?[indexPath.row]
        self.parentContainerViewController()?.openVC(storyBoard: "Main", identifier: "NewsDetailsViewController")
    }
    
}
