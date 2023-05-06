//
//  NewsHighlightsTableVC.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit

class NewsHighlightsTableVC: UITableViewCell {

    var view_model : HomeViewModel?{
        didSet{
            collectionView.reloadData()
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        
        collectionView.registerCell(identifier: "HighlightsItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewsHighlightsTableVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return view_model?.videoList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HighlightsItemCollectionVC", for: indexPath) as! HighlightsItemCollectionVC
        cell.configureCell(obj: view_model?.videoList?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(UIScreen.main.bounds.size.width - 37) / 2, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        VideoPlayViewController.selectedVideo = view_model?.videoList?[indexPath.row]
        self.parentContainerViewController()?.openVC(storyBoard: "Main", identifier: "VideoPlayViewController")
    }
    
    
}
