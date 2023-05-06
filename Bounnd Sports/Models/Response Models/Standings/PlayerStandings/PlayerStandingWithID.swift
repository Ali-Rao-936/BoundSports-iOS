//
//  PlayerStandingWithID.swift
//  LiveScore
//
//  Created by KHADER on 21/03/2023.
//

import Foundation
import SwiftyJSON

struct PlayerStandingWithID {

    let playerId: Int?
    let teamId: Int?
    let isHome: Bool?
    let leagueId: Int?
    let season: String?
    let appearanceNum: Int?
    let substituteNum: Int?
    let playingTime: Int?
    let goals: Int?
    let penaltyGoals: Int?
    let shots: Int?
    let shotsTarget: Int?
    let wasFouled: Int?
    let offsides: Int?
    let bestSum: Int?
    let rating: Double?
    let totalPass: Int?
    let passSuc: Int?
    let keyPass: Int?
    let assist: Int?
    let longBall: Int?
    let longBallsSuc: Int?
    let throughBall: Int?
    let throughBallSuc: Int?
    let dribblesSuc: Int?
    let crossNum: Int?
    let crossSuc: Int?
    let tackles: Int?
    let interception: Int?
    let clearance: Int?
    let dispossessed: Int?
    let shotsBlocked: Int?
    let aerialSuc: Int?
    let fouls: Int?
    let red: Int?
    let yellow: Int?
    let turnover: Int?
    let modifyTime: String?

    init(_ json: JSON) {
        playerId = json["playerId"].intValue
        teamId = json["teamId"].intValue
        isHome = json["isHome"].boolValue
        leagueId = json["leagueId"].intValue
        season = json["season"].stringValue
        appearanceNum = json["appearanceNum"].intValue
        substituteNum = json["substituteNum"].intValue
        playingTime = json["playingTime"].intValue
        goals = json["goals"].intValue
        penaltyGoals = json["penaltyGoals"].intValue
        shots = json["shots"].intValue
        shotsTarget = json["shotsTarget"].intValue
        wasFouled = json["wasFouled"].intValue
        offsides = json["offsides"].intValue
        bestSum = json["bestSum"].intValue
        rating = json["rating"].doubleValue
        totalPass = json["totalPass"].intValue
        passSuc = json["passSuc"].intValue
        keyPass = json["keyPass"].intValue
        assist = json["assist"].intValue
        longBall = json["longBall"].intValue
        longBallsSuc = json["longBallsSuc"].intValue
        throughBall = json["throughBall"].intValue
        throughBallSuc = json["throughBallSuc"].intValue
        dribblesSuc = json["dribblesSuc"].intValue
        crossNum = json["crossNum"].intValue
        crossSuc = json["crossSuc"].intValue
        tackles = json["tackles"].intValue
        interception = json["interception"].intValue
        clearance = json["clearance"].intValue
        dispossessed = json["dispossessed"].intValue
        shotsBlocked = json["shotsBlocked"].intValue
        aerialSuc = json["aerialSuc"].intValue
        fouls = json["fouls"].intValue
        red = json["red"].intValue
        yellow = json["yellow"].intValue
        turnover = json["turnover"].intValue
        modifyTime = json["modifyTime"].stringValue
    }

}
