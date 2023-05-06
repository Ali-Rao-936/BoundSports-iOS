//
//  MatchDetailFootball.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct MatchDetailFootballBase {

	let status: Int?
	let message: String?
	let data: DataMatchDetail?

	init(_ json: JSON) {
		status = json["status"].intValue
		message = json["message"].stringValue
		data = DataMatchDetail(json["data"])
	}

}
