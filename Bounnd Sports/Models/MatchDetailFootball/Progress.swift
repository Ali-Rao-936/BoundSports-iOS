//
//  Progress.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct Progress {

	let time: String?
	let title: String?
	let data: [DataProgressMatches]?

	init(_ json: JSON) {
		time = json["time"].stringValue
		title = json["title"].stringValue
		data = json["data"].arrayValue.map { DataProgressMatches($0) }
	}

}
