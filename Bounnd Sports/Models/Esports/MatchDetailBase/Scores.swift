//
//  Scores.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 22, 2023
//
import Foundation
import SwiftyJSON

struct Scores {

	let updateTime: String?
	let team1: String?
	let matchId: String?
	let team2: String?
	let type: String?

	init(_ json: JSON) {
		updateTime = json["update_time"].stringValue
		team1 = json["team1"].stringValue
		matchId = json["match_id"].stringValue
		team2 = json["team2"].stringValue
		type = json["type"].stringValue
	}

}