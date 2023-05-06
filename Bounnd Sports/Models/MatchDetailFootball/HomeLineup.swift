//
//  HomeLineup.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct HomeLineup {

	let lineupState1: String?
	let lineupState2: String?
	let info: [Info]?
	let indicators: [Indicators]?
	let playerHeader: [PlayerHeader]?
	let playerMain: [PlayerMain]?
	let playerSubstitute: [PlayerSubstitute]?

	init(_ json: JSON) {
		lineupState1 = json["lineup_state_1"].stringValue
		lineupState2 = json["lineup_state_2"].stringValue
		info = json["info"].arrayValue.map { Info($0) }
		indicators = json["indicators"].arrayValue.map { Indicators($0) }
		playerHeader = json["player_header"].arrayValue.map { PlayerHeader($0) }
		playerMain = json["player_main"].arrayValue.map { PlayerMain($0) }
		playerSubstitute = json["player_substitute"].arrayValue.map { PlayerSubstitute($0) }
	}

}