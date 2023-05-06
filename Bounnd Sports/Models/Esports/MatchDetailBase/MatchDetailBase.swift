//
//  MatchDetailBase.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 22, 2023
//
import Foundation
import SwiftyJSON

struct MatchDetailBase {

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
	let neutral: String?
	let matchTime: String?
	let homeTeamHalfTimeScore: String?
	let hasPreodds: String?
	let hasStatistics: String?
	let startTime: String?
	let winner: String?
	let hasNews: String?
	let referees: [Any]?
	let status: String?
	let isPending: String?
	let homeTeamNormalTimeScore: String?
	let homeTeamName: String?
	let playerStatics: [Any]?
	let statusCode: String?
	let scores: [Scores]?
	let lineup: [ELineup]?
	let awayTeamEnName: String?
	let tournamentId: String?
	let teamStatics: [Any]?
	let awayTeamScore: String?
	let hasLiveodds: String?
	let homeTeamEnName: String?
	let homeTeamScore: String?
	let hasEvent: String?
	let isVisible: String?
	let statusName: String?
	let hasEventphase: String?
	let endTime: String?
	let timePlayed: String?
	let hasInjury: String?
	let hasLineup: String?
	let awayTeamId: String?
	let sidelined: [Any]?

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
		neutral = json["neutral"].stringValue
		matchTime = json["match_time"].stringValue
		homeTeamHalfTimeScore = json["home_team_half_time_score"].stringValue
		hasPreodds = json["has_preodds"].stringValue
		hasStatistics = json["has_statistics"].stringValue
		startTime = json["start_time"].stringValue
		winner = json["winner"].stringValue
		hasNews = json["has_news"].stringValue
		referees = json["referees"].arrayValue.map { $0 }
		status = json["status"].stringValue
		isPending = json["is_pending"].stringValue
		homeTeamNormalTimeScore = json["home_team_normal_time_score"].stringValue
		homeTeamName = json["home_team_name"].stringValue
		playerStatics = json["player_statics"].arrayValue.map { $0 }
		statusCode = json["status_code"].stringValue
		scores = json["scores"].arrayValue.map { Scores($0) }
		lineup = json["lineup"].arrayValue.map { ELineup($0) }
		awayTeamEnName = json["away_team_en_name"].stringValue
		tournamentId = json["tournament_id"].stringValue
		teamStatics = json["team_statics"].arrayValue.map { $0 }
		awayTeamScore = json["away_team_score"].stringValue
		hasLiveodds = json["has_liveodds"].stringValue
		homeTeamEnName = json["home_team_en_name"].stringValue
		homeTeamScore = json["home_team_score"].stringValue
		hasEvent = json["has_event"].stringValue
		isVisible = json["is_visible"].stringValue
		statusName = json["status_name"].stringValue
		hasEventphase = json["has_eventphase"].stringValue
		endTime = json["end_time"].stringValue
		timePlayed = json["time_played"].stringValue
		hasInjury = json["has_injury"].stringValue
		hasLineup = json["has_lineup"].stringValue
		awayTeamId = json["away_team_id"].stringValue
		sidelined = json["sidelined"].arrayValue.map { $0 }
	}

}
