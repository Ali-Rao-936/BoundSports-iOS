//
//  DataDetails.swift
//  Proball Sports
//
//  Created by KHADER on 15/03/2023.
//
//

import Foundation
import SwiftyJSON

struct DataDetails {

    let userId: String?
    let username: String?
    let userImageUrl: String?
    let userDescription: String?
    let gender: String?
    let workingExperience: String?
    let footballAccuracy: String?
    let basketballAccuracy: String?
    let gameType: String?
    let predictTeamId: String?
    let predictIndicator: String?
    let predictResult: String?
    let finalResult: String?
    let timestamp: String?
    let viewCount: String?
    let title: String?
    let explanation: String?
    let matchId: String?
    let color: String?
    let leagueId: String?
    let leagueName: String?
    let homeTeamId: String?
    let homeTeamName: String?
    let homeTeamLogo: String?
    let awayTeamId: String?
    let awayTeamName: String?
    let awayTeamLogo: String?
    let homeTeamScore: String?
    let awayTeamScore: String?
    let matchTime: String?
    let state: String?
    let totalFootballAnalysisCreated: String?
    let totalFootballAnalysisWon: String?
    let totalFootballAnalysisLose: String?
    let totalFootballAnalysisDraw: String?
    let totalFootballAnalysisWithdraw: String?
    let totalBasketballAnalysisCreated: String?
    let totalBasketballAnalysisWon: String?
    let totalBasketballAnalysisLose: String?
    let totalBasketballAnalysisDraw: String?
    let totalBasketballAnalysisWithdraw: String?
    let totalFollower: String?
    let analysisId: String?
    let reviewStatus: String?
    let publish: String?
    let isFollow: String?
    let isBookmark: String?
    let isFavourite: String?
    let favouriteCount: String?
    let totalPost: String?
    let totalAnalysis: String?
    let relativeTime: String?

    init(_ json: JSON) {
        userId = json["user_id"].stringValue
        username = json["username"].stringValue
        userImageUrl = json["user_image_url"].stringValue
        userDescription = json["user_description"].stringValue
        gender = json["gender"].stringValue
        workingExperience = json["working_experience"].stringValue
        footballAccuracy = json["football_accuracy"].stringValue
        basketballAccuracy = json["basketball_accuracy"].stringValue
        gameType = json["game_type"].stringValue
        predictTeamId = json["predict_team_id"].stringValue
        predictIndicator = json["predict_indicator"].stringValue
        predictResult = json["predict_result"].stringValue
        finalResult = json["final_result"].stringValue
        timestamp = json["timestamp"].stringValue
        viewCount = json["view_count"].stringValue
        title = json["title"].stringValue
        explanation = json["explanation"].stringValue
        matchId = json["match_id"].stringValue
        color = json["color"].stringValue
        leagueId = json["league_id"].stringValue
        leagueName = json["league_name"].stringValue
        homeTeamId = json["home_team_id"].stringValue
        homeTeamName = json["home_team_name"].stringValue
        homeTeamLogo = json["home_team_logo"].stringValue
        awayTeamId = json["away_team_id"].stringValue
        awayTeamName = json["away_team_name"].stringValue
        awayTeamLogo = json["away_team_logo"].stringValue
        homeTeamScore = json["home_team_score"].stringValue
        awayTeamScore = json["away_team_score"].stringValue
        matchTime = json["match_time"].stringValue
        state = json["state"].stringValue
        totalFootballAnalysisCreated = json["total_football_analysis_created"].stringValue
        totalFootballAnalysisWon = json["total_football_analysis_won"].stringValue
        totalFootballAnalysisLose = json["total_football_analysis_lose"].stringValue
        totalFootballAnalysisDraw = json["total_football_analysis_draw"].stringValue
        totalFootballAnalysisWithdraw = json["total_football_analysis_withdraw"].stringValue
        totalBasketballAnalysisCreated = json["total_basketball_analysis_created"].stringValue
        totalBasketballAnalysisWon = json["total_basketball_analysis_won"].stringValue
        totalBasketballAnalysisLose = json["total_basketball_analysis_lose"].stringValue
        totalBasketballAnalysisDraw = json["total_basketball_analysis_draw"].stringValue
        totalBasketballAnalysisWithdraw = json["total_basketball_analysis_withdraw"].stringValue
        totalFollower = json["total_follower"].stringValue
        analysisId = json["analysis_id"].stringValue
        reviewStatus = json["review_status"].stringValue
        publish = json["publish"].stringValue
        isFollow = json["is_follow"].stringValue
        isBookmark = json["is_bookmark"].stringValue
        isFavourite = json["is_favourite"].stringValue
        favouriteCount = json["favourite_count"].stringValue
        totalPost = json["total_post"].stringValue
        totalAnalysis = json["total_analysis"].stringValue
        relativeTime = json["relative_time"].stringValue
    }

}
