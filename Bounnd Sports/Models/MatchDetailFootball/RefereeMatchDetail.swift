//
//  Referee.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct RefereeMatchDetail {

	let name: String?
	let image: String?
	let indicators: [Indicators]?

	init(_ json: JSON) {
		name = json["name"].stringValue
		image = json["image"].stringValue
		indicators = json["indicators"].arrayValue.map { Indicators($0) }
	}

}
