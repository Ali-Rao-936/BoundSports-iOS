//
//  ZeyutyAPI.swift
//  Shoot Sports
//
//  Created by Yahya on 3/20/23.
//

import Foundation

class ZeyutyAPI:WebService{
    
    func getAllEsportsMatches(pageNumber:String, completion : @escaping (EsportsBase) -> Void , failed : @escaping (String) -> Void ){
        let url = BaseUrl.getBaseUrl(apiType: .APIZEYU) + EndPoints.esportsList.rawValue + "?page=" + pageNumber
        get(url: url, params: nil, completion: {result in
            let response = EsportsBase(result!)
            completion(response)
        }, failed: failed)
    }
    func getEsportsMatchesFor(esportsType:String,pageNumber:String, completion : @escaping (EsportsBase) -> Void , failed : @escaping (String) -> Void ){
        let url = BaseUrl.getBaseUrl(apiType: .APIZEYU) + EndPoints.esportsList.rawValue + "?page=" + pageNumber + "&sportId=" + esportsType
        get(url: url, params: nil, completion: {result in
            let response = EsportsBase(result!)
            completion(response)
        }, failed: failed)
    }
    
    func getEsportsLeaguesFor(esportsType:String,completion:@escaping([DataLeagues]) -> Void , failed : @escaping (String) -> Void  ){
        let url = BaseUrl.getBaseUrl(apiType: .APIZEYU) + EndPoints.esportsLeagues.rawValue + esportsType
        get(url: url, params: nil, completion: { json in
            let response = json!.arrayValue.map { DataLeagues($0) }
            completion(response)
        }, failed: failed)
    }
    func getMatchDetail(matchID:String,completion:@escaping(MatchDetailBase) -> Void , failed : @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .APIZEYU) + EndPoints.esportsMatchDetail.rawValue + matchID + "/details"
        get(url: url, params: nil, completion: { json in
            let response = MatchDetailBase(json!)
            completion(response)
        }, failed: failed)
     }
    
}
