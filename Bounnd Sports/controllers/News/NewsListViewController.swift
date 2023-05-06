//
//  NewsListViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 01/05/2023.
//

import UIKit

class NewsListViewController: UIViewController, HomeViewModelDelegate {
    func didFinishFetchNews() {
        collectionView.reloadData()
    }
    
    func didFinishFetchCategories() {
        
    }
    
    func didFinishFetchVideos() {
        
    }
    

    var page = 1
    var view_model = HomeViewModel()
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackButton()
        setupNavBar(name: "News")
        view_model.delegate = self
        view_model.getNews(page: page)
        collectionView.registerCell(identifier: "NewsItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    

}

extension NewsListViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return view_model.newsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsItemCollectionVC", for: indexPath) as! NewsItemCollectionVC
        cell.configration(news_detail: view_model.newsList?[indexPath.row])
        
        if indexPath.row == (view_model.newsList?.count ?? 0) - 1 {
            page = page + 1
            view_model.getNews(page: page)
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width - 32) / 2, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NewsDetailsViewController.newsList = view_model.newsList
        NewsDetailsViewController.news = view_model.newsList?[indexPath.row]
        self.openVC(storyBoard: "Main", identifier: "NewsDetailsViewController")
    }
    
}
