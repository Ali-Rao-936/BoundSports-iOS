//
//  Data.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 20, 2023
//
import Foundation
import SwiftyJSON

struct DataEsports {

	let sportId: String?
	let homeTeamId: String?
	let awayTeamName: String?
	let updateTimestamp: String?
	let hasPhase: String?
	let currentPeriodStartTime: String?
	let id: String?
	let awayTeamHalfTimeScore: String?
	let hasPlayerStatistics: String?
	let period: String?
	let awayTeamNormalTimeScore: String?
	let lmtMode: String?
	let matchTime: String?
	let homeTeamHalfTimeScore: String?
	let hasPreodds: String?
	let hasStatistics: String?
	let timeRemaining: String?
	let startTime: String?
	let winner: String?
	let hasNews: String?
	let status: String?
	let isPending: String?
	let homeTeamNormalTimeScore: String?
	let homeTeamName: String?
	let timeRunning: String?
	let statusCode: String?
	let scores: [Scores]?
	let awayTeamEnName: String?
	let tournamentId: String?
	let homeFormation: String?
	let awayTeamScore: String?
	let hasLiveodds: String?
	let homeTeamEnName: String?
	let homeTeamScore: String?
	let hasEvent: String?
	let isVisible: String?
	let statusName: String?
	let hasEventphase: String?
	let timePlayed: String?
	let hasInjury: String?
	let hasLineup: String?
	let awayTeamId: String?
	let league: LeagueEsports?
	let homeTeamLogo: String?
	let awayTeamLogo: String?
	let animationUrl: Any?
	let isReserve: Int?

	init(_ json: JSON) {
		sportId = json["sport_id"].stringValue
		homeTeamId = json["home_team_id"].stringValue
		awayTeamName = json["away_team_name"].stringValue
		updateTimestamp = json["update_timestamp"].stringValue
		hasPhase = json["has_phase"].stringValue
		currentPeriodStartTime = json["current_period_start_time"].stringValue
		id = json["id"].stringValue
		awayTeamHalfTimeScore = json["away_team_half_time_score"].stringValue
		hasPlayerStatistics = json["has_player_statistics"].stringValue
		period = json["period"].stringValue
		awayTeamNormalTimeScore = json["away_team_normal_time_score"].stringValue
		lmtMode = json["lmt_mode"].stringValue
		matchTime = json["match_time"].stringValue
		homeTeamHalfTimeScore = json["home_team_half_time_score"].stringValue
		hasPreodds = json["has_preodds"].stringValue
		hasStatistics = json["has_statistics"].stringValue
		timeRemaining = json["time_remaining"].stringValue
		startTime = json["start_time"].stringValue
		winner = json["winner"].stringValue
		hasNews = json["has_news"].stringValue
		status = json["status"].stringValue
		isPending = json["is_pending"].stringValue
		homeTeamNormalTimeScore = json["home_team_normal_time_score"].stringValue
		homeTeamName = json["home_team_name"].stringValue
		timeRunning = json["time_running"].stringValue
		statusCode = json["status_code"].stringValue
		scores = json["scores"].arrayValue.map { Scores($0) }
		awayTeamEnName = json["away_team_en_name"].stringValue
		tournamentId = json["tournament_id"].stringValue
		homeFormation = json["home_formation"].stringValue
		awayTeamScore = json["away_team_score"].stringValue
		hasLiveodds = json["has_liveodds"].stringValue
		homeTeamEnName = json["home_team_en_name"].stringValue
		homeTeamScore = json["home_team_score"].stringValue
		hasEvent = json["has_event"].stringValue
		isVisible = json["is_visible"].stringValue
		statusName = json["status_name"].stringValue
		hasEventphase = json["has_eventphase"].stringValue
		timePlayed = json["time_played"].stringValue
		hasInjury = json["has_injury"].stringValue
		hasLineup = json["has_lineup"].stringValue
		awayTeamId = json["away_team_id"].stringValue
		league = LeagueEsports(json["league"])
		homeTeamLogo = json["home_team_logo"].stringValue
		awayTeamLogo = json["away_team_logo"].stringValue
		animationUrl = json["animationUrl"]
		isReserve = json["isReserve"].intValue
	}

}
