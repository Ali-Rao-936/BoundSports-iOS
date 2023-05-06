//
//  Lineup.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 22, 2023
//
import Foundation
import SwiftyJSON

struct ELineup {

	let playerId: String?
	let teamId: String?
	let playerName: String?
	let playerPicUrl: String?
	let substitute: String?

	init(_ json: JSON) {
		playerId = json["player_id"].stringValue
		teamId = json["team_id"].stringValue
		playerName = json["player_name"].stringValue
		playerPicUrl = json["player_pic_url"].stringValue
		substitute = json["substitute"].stringValue
	}

}
