//
//  HomeAPI.swift
//  775775Sports
//
//  Created by Remya on 9/7/22.
//

import Foundation
import SwiftyJSON

class HomeAPI: WebService {
   
    func getScores(page:Int,completion:@escaping (ScoresResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.scores.rawValue + "/\(Utility.getCurrentLang())/\(page)"
        get(url: url, params: [:], completion: { json in
            let response = ScoresResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getScoresByLeague(id:Int,completion:@escaping (ScoresResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.scores_league.rawValue + "/\(Utility.getCurrentLang())/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = ScoresResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getPlayerStandingsList(leagueID:Int,subLeagueID:Int,completion:@escaping (PlayerStandingsResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.playerStandings.rawValue + "/\(leagueID)/season/\(subLeagueID)"
        get(url: url, params: [:], completion: { json in
            let response = PlayerStandingsResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getScoresPastFuture(date:String,completion:@escaping (RecentMatchResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.scores_past_future.rawValue + "/\(date)"
        get(url: url, params: [:], completion: { json in
            let response = RecentMatchResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getScoresByIndex(completion:@escaping (ScoresByIndexResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.scores_index.rawValue
        get(url: url, params: [:], completion: { json in
            let response = ScoresByIndexResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getScoresByAnalysis(id:Int,completion:@escaping (ScoreAnalysisResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.scores_analysis.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = ScoreAnalysisResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getEvents(completion:@escaping (EventResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.scores_events.rawValue
        get(url: url, params: [:], completion: { json in
            let response = EventResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBriefing(id:Int,completion:@escaping (BreiefingResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.scores_briefing.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BreiefingResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    
    func getLeagueDetails(id:Int,subID:Int,grpID:Int,completion:@escaping (JSON?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.scores_league.rawValue + "/\(id)/\(subID)/\(grpID)"
        get(url: url, params: [:], completion: { json in
            completion(json)
        }, failed: failed)
    }
    
    func getMatchDetails(id:Int,completion:@escaping (ScoresResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.matchDetails.rawValue + "/\(Utility.getCurrentLang())/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = ScoresResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    
    //Basketball APIs
    func getBasketballScores(completion:@escaping (BasketballScoreResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.basketball_scores.rawValue
        get(url: url, params: [:], completion: { json in
            let response = BasketballScoreResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballMatchDetails(id:Int,completion:@escaping (BasketballScoreResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.basketball_match_details.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballScoreResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballScoresPastFuture(date:String,completion:@escaping (BasketballScoreResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.basketball_past_future.rawValue + "/\(date)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballScoreResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballScoresByIndex(completion:@escaping (BasketballIndexResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.basketball_index.rawValue
        get(url: url, params: [:], completion: { json in
            let response = BasketballIndexResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballAnalysis(id:Int,completion:@escaping (BasketballAnalysisResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.basketball_analysis.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballAnalysisResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballLeagueDetails(id:Int,completion:@escaping (BasketballLeagueResponse?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.basketball_league.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballLeagueResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getBasketballBriefing(id:Int,completion:@escaping (BasketballBriefingDetails) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.basketball_briefing.rawValue + "/\(id)"
        get(url: url, params: [:], completion: { json in
            let response = BasketballBriefingDetails(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getUrlInfo(completion:@escaping (UrlDetails) -> Void, failed: @escaping (String) -> Void){
      //  let url = "https://ios.8xapp.app/api/v1/setting.php"
        let url = "https://c.886811.fun/api/v1/setting.php"
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
        let build = Bundle.main.infoDictionary!["CFBundleVersion"]!
        //"com.test.app",
        //
        //
        
    //    let params:[String:Any] = ["package_name":Bundle.main.bundleIdentifier ?? "",
          let params:[String:Any] = ["package_name":"test1",
            "platform":"iOS",
            "device_name":UIDevice.current.model,
            "version":version,
            "build_number":build]
        
        post(url: url, params: params, completion: { json in
           let response = UrlDetails(json!)
            completion(response)
        }, failed: failed)

    }
   
    
    // lineup
    func getLinupPreview(completion:@escaping (LinupPreview) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.lineupPreview.rawValue
        get(url: url, params: [:], completion: { json in
            let response = LinupPreview(json!)
            completion(response)
        }, failed: failed)
    }
    
//    func getLinup(completion:@escaping (LinupResponse) -> Void, failed: @escaping (String) -> Void){
//        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.linup.rawValue
//        get(url: url, params: [:], completion: { json in
//            let response = LinupResponse(json!)
//            completion(response)
//        }, failed: failed)
//    }
    
    
    // match details
    func getFootballMatchDetail(slug:String,completion:@escaping(MatchDetailFootballBase?) -> Void, failed:@escaping(String) -> Void,game:String ){

        let lang=Utility.getCurrentLang()
        let param:[String:Any]=[
            "lang":lang,
            "slug":slug,
            "sport": game,
            "timezone":"+08:00"
        ]
        let url = BaseUrl.getBaseUrl(apiType: .APIDB) + EndPoints.match.rawValue
        post(url: url, params: param, completion: { json in
            let response = MatchDetailFootballBase(json!)
            completion(response)
        }, failed: failed)
        
    }
}
