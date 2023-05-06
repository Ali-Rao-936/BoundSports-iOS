//
//  LeagueListBase.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 22, 2023
//
import Foundation
import SwiftyJSON

struct LeagueListBase {

	let data: [DataLeagues]?

	init(_ json: JSON) {
		data = json["data"].arrayValue.map { DataLeagues($0) }
	}

}
