//
//  TableData.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct TableData {

	let data: [String]?
	

	init(_ json: JSON) {
        data = json.arrayValue.map { $0.stringValue }
	}

}
