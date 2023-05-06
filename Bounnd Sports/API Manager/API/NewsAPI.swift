//
//  NewsAPI.swift
//  775775Sports
//
//  Created by Remya on 9/8/22.
//

import Foundation

class NewsAPI:WebService{
    
    func getNews(page:Int,completion:@escaping (NewsListResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.newsList.rawValue + "/\(Utility.getCurrentLang())/\(page)"
        get(url: url, params: [:], completion: { json in
            let response = NewsListResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getVideos(page:Int,completion:@escaping (VideoListResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.videoList.rawValue + "/\(Utility.getCurrentLang())/\(page)"
        get(url: url, params: [:], completion: { json in
            let response = VideoListResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getNewsDetails(id:Int,completion:@escaping (NewsDetails) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.newsDetails.rawValue + "/\(Utility.getCurrentLang())/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = NewsDetails(json!)
            completion(response)
        }, failed: failed)
    }
    
    
    func getNewsBasdOnLeagueName(page:Int,league_name:String,completion:@escaping (NewsWithFilterResponse) -> Void, failed: @escaping (String) -> Void){
        //let url = "https://www.77577.live/api/post-keyword/en/Manchester,Transfer?page=1"
        //let url = "https://www.77577.live/api/post-keyword/en/Premier%20League,Transfer?page=1"
        //let url = "https://www.77577.live/api/post-keyword/en/barca,Transfer?page=1"
        
        let replaced = league_name.replacingOccurrences(of: " ", with: "%20")
        
        let url = "https://www.77577.live/api/post-keyword"
        + "/\(Utility.getCurrentLang())/\(replaced),Transfer?page=\(page)"
        
        print("TAG url \(url)")
        print("TAG url https://www.77577.live/api/post-keyword/en/Premier%20League,Transfer?page=1")
        get(url: url, params: [:], completion: { json in
            let response = NewsWithFilterResponse(json!)
            completion(response)
        }, failed: failed)
    }
}
