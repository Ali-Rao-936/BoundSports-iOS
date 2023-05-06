//
//  LineupViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 03/05/2023.
//

import UIKit

class LineupViewController: UIViewController {

    @IBOutlet var emptyView: UIView!
    @IBOutlet var awayName: UILabel!
    @IBOutlet var homeName: UILabel!
    @IBOutlet var awayView: UIView!
    @IBOutlet var homeView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    var isHomeLineup = true
    var matchDetail:MatchDetailFootballBase?{
        didSet{
            collectionView.reloadData()
            emptyView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.registerCell(identifier: "LineupItemCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        homeView.setOnClickListener {
            self.isHomeLineup = true
            self.collectionView.reloadData()
            self.homeView.backgroundColor = Colors.primaryColor()
            self.awayView.backgroundColor =  .white
            self.homeName.textColor = .white
            self.awayName.textColor = .black
        }
        
        awayView.setOnClickListener {
            self.isHomeLineup = false
            self.collectionView.reloadData()
            self.awayView.backgroundColor = Colors.primaryColor()
            self.homeView.backgroundColor =  .white
            self.homeName.textColor = .black
            self.awayName.textColor = .white
        }
    }

}
extension LineupViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isHomeLineup {
            return matchDetail?.data?.homeLineup?.playerMain?.count ?? 0
        }
        else{
            return matchDetail?.data?.awayLineup?.playerMain?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LineupItemCollectionVC", for: indexPath) as! LineupItemCollectionVC
        if isHomeLineup {
            cell.configureCell(data: matchDetail?.data?.homeLineup?.playerMain?[indexPath.row].data ?? [])
        }
        else{
            cell.configureCell(data: matchDetail?.data?.awayLineup?.playerMain?[indexPath.row].data ?? [])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 40, height: 100)
    }
    
}
