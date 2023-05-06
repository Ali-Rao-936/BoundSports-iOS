//
//  Statistics.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct StatisticsMatchDetail{

	let header: String?
	let data: [DataStatistics]?

	init(_ json: JSON) {
		header = json["header"].stringValue
		data = json["data"].arrayValue.map { DataStatistics($0) }
	}

}
