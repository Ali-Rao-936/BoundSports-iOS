//
//  Series.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct Series {

	let number: String?
	let data: [DataSeries]?

	init(_ json: JSON) {
		number = json["number"].stringValue
		data = json["data"].arrayValue.map { DataSeries($0) }
	}

}
