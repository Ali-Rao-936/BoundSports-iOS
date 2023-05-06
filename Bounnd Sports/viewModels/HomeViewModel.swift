//
//  HomeViewModel.swift
//  Bounnd Sports
//
//  Created by Qoo on 28/04/2023.
//

import Foundation


protocol HomeViewModelDelegate{
    func didFinishFetchNews()
    func didFinishFetchCategories()
    func didFinishFetchVideos()
}



class HomeViewModel{
    var videoList:[VideoList]?
    var videoPageData:Meta?
    var categories:Categories?
    var newsList:[NewsList]?
    var newsList2:[NewsList]?
    var newsPageData:Meta?
    var delegate:HomeViewModelDelegate?

    func getNews(page:Int){
        Utility.showProgress()
        NewsAPI().getNews(page: page) { response in
            self.newsPageData = response.meta
            if page == 1{
            self.newsList = response.list
            }
            else{
                var tempList:[NewsList] = self.newsList ?? []
                tempList.append(contentsOf: response.list ?? [])
                self.newsList = tempList
            }
            self.delegate?.didFinishFetchNews()
            
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

    }
    func getNews2(page:Int){
        Utility.showProgress()
        NewsAPI().getNews(page: page) { response in
            self.newsPageData = response.meta
            var tempList:[NewsList] = self.newsList ?? []
            tempList.append(contentsOf: response.list ?? [])
            self.newsList2 = tempList
            self.delegate?.didFinishFetchNews()
            
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

    }
    
    
    func getCategories(cat_type:String){
        //Utility.showProgress()
        CategoriesAPI().getCategories(cat_type: cat_type, pageIndex: 1) { response in
            self.categories = response
            self.delegate?.didFinishFetchCategories()

        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }


    }
    
    
    func getVideos(page:Int){
       // Utility.showProgress()
       

        NewsAPI().getVideos(page: page) { response in
            self.videoPageData = response.meta
            
            if page == 1{
                self.videoList = response.list
            }
            else{
                var tmpList:[VideoList] = self.videoList ?? []
                tmpList.append(contentsOf: response.list ?? [])
                self.videoList = tmpList
            }
            self.delegate?.didFinishFetchVideos()
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

        
    }
}
