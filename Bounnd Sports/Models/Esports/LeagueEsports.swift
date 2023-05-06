//
//  League.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 20, 2023
//
import Foundation
import SwiftyJSON

struct LeagueEsports {

	let sportId: String?
	let logoUrl: String?
	let level: String?
	let innerLevel: String?
	let type: String?
	let reverse: String?
	let enAlias: String?
	let updateTime: String?
	let cnName: String?
	let deleted: String?
	let leagueType: String?
	let enName: String?
	let id: String?
	let cnAlias: String?
    let periodType: String?
	let matchTime: String?

	init(_ json: JSON) {
		sportId = json["sport_id"].stringValue
		logoUrl = json["logo_url"].stringValue
		level = json["level"].stringValue
		innerLevel = json["inner_level"].stringValue
		type = json["type"].stringValue
		reverse = json["reverse"].stringValue
		enAlias = json["en_alias"].stringValue
		updateTime = json["update_time"].stringValue
		cnName = json["cn_name"].stringValue
		deleted = json["deleted"].stringValue
		leagueType = json["league_type"].stringValue
		enName = json["en_name"].stringValue
		id = json["id"].stringValue
		cnAlias = json["cn_alias"].stringValue
        periodType = json["period_type"].stringValue
        matchTime = json["match_time"].stringValue
	}

}
