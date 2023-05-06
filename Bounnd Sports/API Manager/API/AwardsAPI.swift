//
//  AwardsAPI.swift
//  775775Sports
//
//  Created by Remya on 9/9/22.
//

import Foundation

class AwardsAPI:WebService{
    
    func getTeamStandingsList(leagueID:Int,subLeagueID:Int,completion:@escaping (TeamStandingsResponse) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .API775) + EndPoints.teamStandings.rawValue + "/\(leagueID)/sub/\(subLeagueID)"
        get(url: url, params: [:], completion: { json in
            let response = TeamStandingsResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getPlayerStandingsList(leagueID:Int,subLeagueID:Int,completion:@escaping (PlayerStandingWithIDResponse) -> Void, failed: @escaping (String) -> Void){
        let url = "https://www.77577.live/api/zqbf-list-jifen-player-count" + "/\(leagueID)"
        
//        print("TAG PlayerList url \(url)")
//        print("TAG PlayerList url https://www.77577.live/api/zqbf-list-jifen-player-count/36")
        get(url: url, params: [:], completion: { json in
            let response = PlayerStandingWithIDResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    func getPlayerStandingsWithNameList(leagueID:Int,subLeagueID:Int,completion:@escaping (PlayerStandingWithNameResponse) -> Void, failed: @escaping (String) -> Void){
        let url = "https://www.77577.live/api/zqbf-list-jifen-top-scorer" + "/\(leagueID)/season/\(subLeagueID)"
        
//        print("TAG PlayerName url \(url)")
//        print("TAG PlayerName url https://www.77577.live/api/zqbf-list-jifen-top-scorer/36/season/0")

        get(url: url, params: [:], completion: { json in
            let response = PlayerStandingWithNameResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    
}
