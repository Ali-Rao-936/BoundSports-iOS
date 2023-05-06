//
//  Matches.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 27, 2023
//
import Foundation
import SwiftyJSON

struct MatchCategory {

    let slug: String?
    let time: String?
    let matchState: String?
    let countDown: String?
    let homeTeam: String?
    let awayTeam: String?
    let homeScore: String?
    let awayScore: String?
    
    //this part added to handle football part
    let homeFirstHalfScore: String?
    let homeSecondHalfScore: String?
    let awayFirstHalfScore: String?
    let awaySecondHalfScore: String?
    
    //this part added to handle basketball part
    let homeQ1: String?
    let homeQ2: String?
    let homeQ3: String?
    let homeQ4: String?
    let awayQ1: String?
    let awayQ2: String?
    let awayQ3: String?
    let awayQ4: String?
    
    //this part added to handle Hockey part
    let home1st: String?
    let home2nd: String?
    let home3rd: String?
    let away1st: String?
    let away2nd: String?
    let away3rd: String?
    
    //this part added to handle handball part
    let home1stHalf: String?
    let home2ndHalf: String?
    let away1stHalf: String?
    let away2ndHalf: String?
    
    //this part added to handle tennis part
    let homeSet1: String?
    let homeSet1Superscript: String?
    let homeSet2: String?
    let homeSet2Superscript: String?
    let homeSet3: String?
    let homeSet3Superscript: String?
    let awaySet1: String?
    let awaySet1Superscript: String?
    let awaySet2: String?
    let awaySet2Superscript: String?
    let awaySet3: String?
    let awaySet3Superscript: String?
    
    //this part added to handle volleyball part

    let home4th: String?
    let home5th: String?

    let away4th: String?
    let away5th: String?
    
    let odds1Indicator: String?
    let odds1Value: String?
    let odds2Indicator: String?
    let odds2Value: String?
    let odds3Indicator: String?
    let odds3Value: String?
    let lineup: Bool?

    init(_ json: JSON) {
        slug = json["slug"].stringValue
        time = json["time"].stringValue
        matchState = json["match_state"].stringValue
        countDown = json["count_down"].stringValue
        homeTeam = json["home_team"].stringValue
        awayTeam = json["away_team"].stringValue
        homeScore = json["home_score"].stringValue
        awayScore = json["away_score"].stringValue
        
        //football
        homeFirstHalfScore = json["home_first_half_score"].stringValue
        homeSecondHalfScore = json["home_second_half_score"].stringValue
        awayFirstHalfScore = json["away_first_half_score"].stringValue
        awaySecondHalfScore = json["away_second_half_score"].stringValue

        //basketball
        homeQ1 = json["home_q1"].stringValue
        homeQ2 = json["home_q2"].stringValue
        homeQ3 = json["home_q3"].stringValue
        homeQ4 = json["home_q4"].stringValue
        awayQ1 = json["away_q1"].stringValue
        awayQ2 = json["away_q2"].stringValue
        awayQ3 = json["away_q3"].stringValue
        awayQ4 = json["away_q4"].stringValue

        //Hockey
        home1st = json["home_1st"].stringValue
        home2nd = json["home_2nd"].stringValue
        home3rd = json["home_3rd"].stringValue
        away1st = json["away_1st"].stringValue
        away2nd = json["away_2nd"].stringValue
        away3rd = json["away_3rd"].stringValue
        
        //handball
        home1stHalf = json["home_1st_half"].stringValue
        home2ndHalf = json["home_2nd_half"].stringValue
        away1stHalf = json["away_1st_half"].stringValue
        away2ndHalf = json["away_2nd_half"].stringValue
        
        //tennis
        homeSet1 = json["home_set_1"].stringValue
        homeSet1Superscript = json["home_set_1_superscript"].stringValue
        homeSet2 = json["home_set_2"].stringValue
        homeSet2Superscript = json["home_set_2_superscript"].stringValue
        homeSet3 = json["home_set_3"].stringValue
        homeSet3Superscript = json["home_set_3_superscript"].stringValue
        awaySet1 = json["away_set_1"].stringValue
        awaySet1Superscript = json["away_set_1_superscript"].stringValue
        awaySet2 = json["away_set_2"].stringValue
        awaySet2Superscript = json["away_set_2_superscript"].stringValue
        awaySet3 = json["away_set_3"].stringValue
        awaySet3Superscript = json["away_set_3_superscript"].stringValue
        
        
        //volleyball
        home4th = json["home_4th"].stringValue
        home5th = json["home_5th"].stringValue
        
        away4th = json["away_4th"].stringValue
        away5th = json["away_5th"].stringValue
        
        odds1Indicator = json["odds_1_indicator"].stringValue
        odds1Value = json["odds_1_value"].stringValue
        odds2Indicator = json["odds_2_indicator"].stringValue
        odds2Value = json["odds_2_value"].stringValue
        odds3Indicator = json["odds_3_indicator"].stringValue
        odds3Value = json["odds_3_value"].stringValue
        lineup = json["lineup"].boolValue
    }

}
