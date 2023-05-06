//
//  TeamDetailsAPI.swift
//  LiveScore
//
//  Created by KHADER on 22/03/2023.
//

import Foundation

class TeamDetailsAPI:WebService{
    
    func getTeamDetails(team_id:Int,completion:@escaping (TeamDetails) -> Void, failed: @escaping (String) -> Void){
        //let url = "https://www.77577.live/api/zqbf-list-team/33"
        let url = "https://www.77577.live/api/zqbf-list-team/\(team_id)"

        
        get(url: url, params: [:], completion: { json in
            let response = TeamDetails(json!)
            completion(response)
        }, failed: failed)
    }
    
}
