//
//  Info.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct Info {

	let key: String?
	let value: String?

	init(_ json: JSON) {
		key = json["key"].stringValue
		value = json["value"].stringValue
	}

}