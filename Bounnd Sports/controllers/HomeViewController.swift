//
//  HomeViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 25/04/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    var  matchesList : [MatchCategory]? = []
    static var leagueList : [String] = []
    
    var cat_typ = "esports"
    var liveList : [DataEsports] = []
    var otherList : [DataEsports] = []
    var view_model = HomeViewModel()
    var viewmodel=EsportsViewModel()
    var categories_list:[CategoryList]?
    var isSearch = false
    static var urlDetails : UrlDetails?
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackButton()
      //  self.tabBarController?.navigationItem.title = "YOUT TITLE NAME"
        setupNavBar(name: "GoLiveScore")
        Utility.showProgress()
        view_model.delegate = self
        viewmodel.delegate=self
        viewmodel.getAllEsportsMatches(page: "1")
        CategoryList.populateCategoriesList()
        categories_list = CategoryList.categories
        searchBar.delegate = self
        
       
        tableView.register(UINib(nibName: "LiveEsportsTableVC", bundle: nil), forCellReuseIdentifier: "LiveEsportsTableVC")
        tableView.register(UINib(nibName: "EsportsGamesTableVC", bundle: nil), forCellReuseIdentifier: "EsportsGamesTableVC")
        tableView.register(UINib(nibName: "LolTeamsTableVC", bundle: nil), forCellReuseIdentifier: "LolTeamsTableVC")
        tableView.register(UINib(nibName: "CSGOTeamsTableVC", bundle: nil), forCellReuseIdentifier: "CSGOTeamsTableVC")
        tableView.register(UINib(nibName: "HomeTodayTableVC", bundle: nil), forCellReuseIdentifier: "HomeTodayTableVC")
        tableView.register(UINib(nibName: "TopMatchesTableVC", bundle: nil), forCellReuseIdentifier: "TopMatchesTableVC")
        tableView.register(UINib(nibName: "OtherMatchesTableVC", bundle: nil), forCellReuseIdentifier: "OtherMatchesTableVC")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        collectionView.registerCell(identifier: "MatchestitleCollectionVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .right)
    }

    
    func setupRightButton(){
        if AppPreferences.getMapObject() != nil {
         //   let btn = getButton(image: UIImage(named: "Internet")!)
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
            btn.setImage(UIImage(named: "Internet"), for: .normal)
            btn.addTarget(self, action: #selector(specialButtonAction), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        }
    }
    
    @objc func specialButtonAction() {
        if AppPreferences.getMapObject()?.openType == "0"{
            AppPreferences.setIsSearched(value: true)
            let urlString = AppPreferences.getMapObject()?.redirectUrl ?? ""
        gotoWebview(url: urlString)
        }
        else{
            AppPreferences.setIsSearched(value: false)
            guard let url = URL(string: AppPreferences.getMapObject()?.redirectUrl ?? "") else{return}
                    Utility.openUrl(url: url)
        }
        
    }
    

    func gotoWebview(url:String){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
        if url != ""{
            vc.urlString = url
        }
        self.navigationController?.pushViewController(vc, animated: true)
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupRightButton()
    }
    
}


extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearch {
            return 1
        }else{
            if cat_typ == "esports" {
                return 5
            }else{
                return 2
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearch {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTodayTableVC") as! HomeTodayTableVC
            cell.otherList = self.viewmodel.esportsSearchListing
            return cell
        }else{
            
            if cat_typ == "esports" {
                // e-sports
                if indexPath.section == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "LiveEsportsTableVC") as! LiveEsportsTableVC
                    if liveList.count > 0 {
                        cell.liveList = self.liveList
                    }else{
                        cell.noMatchesLable.isHidden = false
                        cell.collectionView.isHidden = true
                    }
                    return cell
                }
                else if indexPath.section == 1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "EsportsGamesTableVC") as! EsportsGamesTableVC
                    
                    return cell
                }
                else if indexPath.section == 2 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "LolTeamsTableVC") as! LolTeamsTableVC
                    
                    return cell
                }
                else if indexPath.section == 3 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "CSGOTeamsTableVC") as! CSGOTeamsTableVC
                    
                    return cell
                }
                else  {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTodayTableVC") as! HomeTodayTableVC
                    cell.otherList = self.otherList
                    return cell
                }
                
                
            }else{     // other sports
                
                if indexPath.section == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "TopMatchesTableVC") as! TopMatchesTableVC
                    cell.category = cat_typ
                    cell.matchesList = self.matchesList
                    return cell
                }
                else  {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "OtherMatchesTableVC") as! OtherMatchesTableVC
                    cell.category = cat_typ
                    cell.matchesList = self.matchesList
                    return cell
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cat_typ == "esports" {
            if indexPath.section == 0 {
                if liveList.count > 2 {
                    return UITableView.automaticDimension
                }else{
                    return 130
                }
            }
            else  if indexPath.section == 4 {
                return CGFloat(otherList.count * 124)
            }else{
                return  UITableView.automaticDimension
            }
        }else {
            if indexPath.section == 1 {
              
               if matchesList!.count > 4 {
                   return  UITableView.automaticDimension
                }
                else{
                    return 160
                }
            }else{
                return  UITableView.automaticDimension
            }
        }
    }
    
    

    
}
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return categories_list?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchestitleCollectionVC", for: indexPath) as! MatchestitleCollectionVC
            cell.titleLable.text = categories_list?[indexPath.row].name
            cell.imgCategory.image = UIImage(named: categories_list?[indexPath.row].image ?? "")
            return cell
      
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            cat_typ = "esports"
            tableView.reloadData()
           // viewmodel.getAllEsportsMatches(page: "1")
        }else{
            Utility.showProgress()
          cat_typ = categories_list?[indexPath.row].name_s ?? "hockey"
            view_model.getCategories(cat_type: cat_typ)
        }
    }
    
    
}

extension HomeViewController:EsportsViewModelDelegate{
    func didFinishFetchMatchDetail() {
        
    }
    
    func didFinishEsportsLeaguesFetch() {
        //self.tableView.reloadData()
    }
    
    
    func didFinishEsportsListFetch() {
    
        
        
        if let matches = viewmodel.esportsListing {
           for data in matches{
               if (data.statusCode ?? "")  != "0"{
                  

                 if liveList.count == 4 {
                     otherList.append(data)
                 }else{
                     liveList.append(data)
                 }
               }else{
                   otherList.append(data)
               }
           }
            self.tableView.reloadRows(at: [ IndexPath(item: 0, section: 0)], with: .none)
            self.tableView.reloadRows(at: [ IndexPath(item: 0, section: 4)], with: .none)
           // self.tableView.reloadData()
       }
    }
}

extension HomeViewController : HomeViewModelDelegate {
    func didFinishFetchNews() {
        
    }
    
    func didFinishFetchCategories() {
        matchesList = []
        HomeViewController.leagueList = []
        if let data = view_model.categories?.data{
            for dat in data {
                if let matches = dat.matches{
                    for _ in matches {
                        HomeViewController.leagueList.append(dat.league ?? "iii")
                    }
                }
                matchesList?.append(contentsOf: dat.matches ?? [])
                
            }
            tableView.reloadData()
        }
        
        
    }
    
    func didFinishFetchVideos() {
        
    }
    
    
}


extension HomeViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.trim() != ""{
            if let obj = HomeViewController.urlDetails?.mapping?.filter({$0.keyword?.lowercased() == searchText.lowercased()}).first{
                AppPreferences.setMapObject(obj: obj)
                if obj.openType == "0"{
                    AppPreferences.setIsSearched(value: true)
                    self.gotoWebview(url: obj.redirectUrl ?? "")
                }
                else{
                    AppPreferences.setIsSearched(value: false)
                    guard let url = URL(string: obj.redirectUrl ?? "") else {return}
                    Utility.openUrl(url: url)
                  //  self.searchBar.text = ""
                }
                
            }
            else{
                doSearch(searchText: searchText)
            }
        }else{
            isSearch = false
            tableView.reloadData()
        }
    }
    
    
    func doSearch(searchText:String){
        viewmodel.esportsSearchListing?.removeAll()
        self.viewmodel.esportsSearchListing = self.viewmodel.esportsListing?.filter{
            
            ($0.homeTeamName?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.awayTeamName?.lowercased().contains(searchText.lowercased()) ?? false)
            || ($0.league?.enName?.lowercased().contains(searchText.lowercased()) ?? false)
        }
        isSearch = true
        tableView.reloadData()
        
    }
}
