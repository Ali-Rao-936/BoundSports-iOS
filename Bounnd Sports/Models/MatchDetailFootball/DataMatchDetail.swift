//
//  Data.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct DataProgress {

	let time: String?
	let score: String?
	let mainPlayerName: String?
	let mainPlayerSlug: String?
	let subPlayerName: String?
	let subPlayerSlug: String?
	let action: String?
	let isHome: Bool?
    

	init(_ json: JSON) {
		time = json["time"].stringValue
		score = json["score"].stringValue
		mainPlayerName = json["main_player_name"].stringValue
		mainPlayerSlug = json["main_player_slug"].stringValue
		subPlayerName = json["sub_player_name"].stringValue
		subPlayerSlug = json["sub_player_slug"].stringValue
		action = json["action"].stringValue
		isHome = json["is_home"].boolValue
	}
}

struct DataMatchDetail {

    let sport: String?
    let sectionName: String?
    let sectionSlug: String?
    let leagueName: String?
    let leagueSlug: String?
    let homeTeamName: String?
    let homeTeamSlug: String?
    let homeTeamImage: String?
    let homeTeamIndicator1: String?
    let homeTeamIndicator2: String?
    let awayTeamName: String?
    let awayTeamSlug: String?
    let awayTeamImage: String?
    let awayTeamIndicator1: String?
    let awayTeamIndicator2: String?
    let matchDatetime: String?
    let matchState: String?
    let countDown: String?
    let homeScore: String?
    let home1stHalf: String?
    let home2ndHalf: String?
    let awayScore: String?
    let away1stHalf: String?
    let away2ndHalf: String?
    let standings: [StandingsMatchDetail]?
    let about: String?
    let homeEvents: [HomeEvents]?
    let awayEvents: [HomeEvents]?
    let medias: [Medias]?
    let referee: RefereeMatchDetail?
    let location: [Indicators]?
    let homeLineup: HomeLineup?
    let awayLineup: HomeLineup?
    let statistics: [StatisticsMatchDetail]?
    let series: Series?
    let progress: [Progress]?
    let homeQ1: String?
    let homeQ2: String?
    let homeQ3: String?
    let homeQ4: String?
    let awayQ1: String?
    let awayQ2: String?
    let awayQ3: String?
    let awayQ4: String?

    init(_ json: JSON) {
        sport = json["sport"].stringValue
        sectionName = json["section_name"].stringValue
        sectionSlug = json["section_slug"].stringValue
        leagueName = json["league_name"].stringValue
        leagueSlug = json["league_slug"].stringValue
        homeTeamName = json["home_team_name"].stringValue
        homeTeamSlug = json["home_team_slug"].stringValue
        homeTeamImage = json["home_team_image"].stringValue
        homeTeamIndicator1 = json["home_team_indicator_1"].stringValue
        homeTeamIndicator2 = json["home_team_indicator_2"].stringValue
        awayTeamName = json["away_team_name"].stringValue
        awayTeamSlug = json["away_team_slug"].stringValue
        awayTeamImage = json["away_team_image"].stringValue
        awayTeamIndicator1 = json["away_team_indicator_1"].stringValue
        awayTeamIndicator2 = json["away_team_indicator_2"].stringValue
        matchDatetime = json["match_datetime"].stringValue
        matchState = json["match_state"].stringValue
        countDown = json["count_down"].stringValue
        homeScore = json["home_score"].stringValue
        home1stHalf = json["home_1st_half"].stringValue
        home2ndHalf = json["home_2nd_half"].stringValue
        awayScore = json["away_score"].stringValue
        away1stHalf = json["away_1st_half"].stringValue
        away2ndHalf = json["away_2nd_half"].stringValue
        standings = json["standings"].arrayValue.map { StandingsMatchDetail($0) }
        about = json["about"].stringValue
        homeEvents = json["home_events"].arrayValue.map { HomeEvents($0) }
        awayEvents = json["away_events"].arrayValue.map { HomeEvents($0) }
        medias = json["medias"].arrayValue.map { Medias($0) }
        referee = RefereeMatchDetail(json["referee"])
        location = json["location"].arrayValue.map { Indicators($0) }
        homeLineup = HomeLineup(json["home_lineup"])
        awayLineup = HomeLineup(json["away_lineup"])
        statistics = json["statistics"].arrayValue.map { StatisticsMatchDetail($0) }
        series = Series(json["series"])
        progress = json["progress"].arrayValue.map { Progress($0) }
        homeQ1 = json["home_q1"].stringValue
        homeQ2 = json["home_q2"].stringValue
        homeQ3 = json["home_q3"].stringValue
        homeQ4 = json["home_q4"].stringValue
        awayQ1 = json["away_q1"].stringValue
        awayQ2 = json["away_q2"].stringValue
        awayQ3 = json["away_q3"].stringValue
        awayQ4 = json["away_q4"].stringValue
    }

}
struct DataStatistics {

    let key: String?
    let homeValue: String?
    let awayValue: String?

    init(_ json: JSON) {
        key = json["key"].stringValue
        homeValue = json["home_value"].stringValue
        awayValue = json["away_value"].stringValue
    }

}

struct DataSeries {

    let header: String?
    let data: [String]?

    init(_ json: JSON) {
        header = json["header"].stringValue
        data = json["data"].arrayValue.map { $0.stringValue }
    }

}

struct DataProgressMatches {

    let time: String?
    let score: String?
    let mainPlayerName: String?
    let mainPlayerSlug: String?
    let subPlayerName: String?
    let subPlayerSlug: String?
    let action: String?
    let isHome: Bool?

    init(_ json: JSON) {
        time = json["time"].stringValue
        score = json["score"].stringValue
        mainPlayerName = json["main_player_name"].stringValue
        mainPlayerSlug = json["main_player_slug"].stringValue
        subPlayerName = json["sub_player_name"].stringValue
        subPlayerSlug = json["sub_player_slug"].stringValue
        action = json["action"].stringValue
        isHome = json["is_home"].boolValue
    }

}
