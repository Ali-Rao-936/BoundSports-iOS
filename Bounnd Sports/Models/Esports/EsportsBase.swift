//
//  EsportsBase.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 20, 2023
//
import Foundation
import SwiftyJSON

struct EsportsBase {

	let pagesCnt: Int?
	let data: [DataEsports]?

	init(_ json: JSON) {
		pagesCnt = json["pagesCnt"].intValue
		data = json["data"].arrayValue.map { DataEsports($0) }
	}

}
