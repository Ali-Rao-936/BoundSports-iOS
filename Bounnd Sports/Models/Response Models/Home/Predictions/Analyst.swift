//
//  Analyst.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 14, 2023
//
import Foundation
import SwiftyJSON

struct Analyst {

    let userId: String?
    let username: String?
    let userImageUrl: String?
    let userDescription: String?
    let gender: String?
    let workingExperience: String?
    let footballAccuracy: String?
    let basketballAccuracy: String?
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
    let isFollow: String?

    init(_ json: JSON) {
        userId = json["user_id"].stringValue
        username = json["username"].stringValue
        userImageUrl = json["user_image_url"].stringValue
        userDescription = json["user_description"].stringValue
        gender = json["gender"].stringValue
        workingExperience = json["working_experience"].stringValue
        footballAccuracy = json["football_accuracy"].stringValue
        basketballAccuracy = json["basketball_accuracy"].stringValue
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
        isFollow = json["is_follow"].stringValue
    }

}
