//
//  TopNewsTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class TopNewsTableVC: UITableViewCell, HomeViewModelDelegate {
    func didFinishFetchVideos() {
        
    }
    
    func didFinishFetchNews() {
        collectionView.reloadData()
    }
    
    func didFinishFetchCategories() {
        
    }
    

    var view_model = HomeViewModel()
    var timer = Timer()
    var counter = 0
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        view_model.delegate = self
        view_model.getNews(page: 1)
        
        collectionView.registerCell(identifier: "TopNewsItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
        DispatchQueue.main.async {
              self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
           }
    }
    
    
    @objc func changeImage() {
             
         if counter < 7 {
              let index = IndexPath.init(item: counter, section: 0)
              self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
             pageControl.currentPage = counter
              counter += 1
         } else {
              counter = 0
              let index = IndexPath.init(item: counter, section: 0)
              self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
             pageControl.currentPage = counter
               counter = 1
           }
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TopNewsTableVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return view_model.newsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopNewsItemCollectionVC", for: indexPath) as! TopNewsItemCollectionVC
        cell.configration(news_detail: view_model.newsList?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 32, height: 195)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NewsDetailsViewController.newsList = view_model.newsList
        NewsDetailsViewController.news = view_model.newsList?[indexPath.row]
        self.parentContainerViewController()?.openVC(storyBoard: "Main", identifier: "NewsDetailsViewController")
    }
}
