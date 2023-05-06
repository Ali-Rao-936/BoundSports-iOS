//
//  NewsDetailsViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 27/04/2023.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var txtNewsDetails: UITextView!
    @IBOutlet var newsDetails: UILabel!
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var imgNews: UIImageView!
    
  static  var newsList:[NewsList]?
  static  var news : NewsList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackButton()
        setupNavBar(name: "News Detail")
        
        collectionView.registerCell(identifier: "NewsItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fillData()
    }
    
    func fillData(){
        if  NewsDetailsViewController.news != nil {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyyWithTimeZone.rawValue
            newsDetails.text = Utility.formatDate(date: dateFormatter.date(from: NewsDetailsViewController.news?.createTime ?? ""), with: .ddMMMyyyy)
            
            imgNews.setImage(with: NewsDetailsViewController.news?.path, placeholder: Utility.getPlaceHolder())
            newsTitle.text = NewsDetailsViewController.news?.title
            
            txtNewsDetails.text = NewsDetailsViewController.news?.description
            
        
           // time_lbl.text = Utility.formatDate(date: dateFormatter.date(from: NewsDetailsViewController.news?.createTime ?? ""), with: .ddMMMyyyy)

            //news_time.text = news_detail?.updateTime
      }
        
    }


}

extension NewsDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (NewsDetailsViewController.newsList?.count ?? 0) - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsItemCollectionVC", for: indexPath) as! NewsItemCollectionVC
        cell.configration(news_detail: NewsDetailsViewController.newsList?[indexPath.row + 1])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 210, height: 110)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NewsDetailsViewController.news = NewsDetailsViewController.newsList?[indexPath.row + 1]
        fillData()
    }
}
