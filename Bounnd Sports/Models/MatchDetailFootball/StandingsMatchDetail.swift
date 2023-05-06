//
//  Standings.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 25, 2023
//
import Foundation
import SwiftyJSON

struct StandingsMatchDetail {

	let name: String?
	var tableHeader: [String]?
	var tableData: [TableData]?

	init(_ json: JSON) {
		name = json["name"].stringValue
		tableHeader = json["table_header"].arrayValue.map { $0.stringValue }
		tableData = json["table_data"].arrayValue.map { TableData($0) }
        if tableHeader?.isEmpty ?? true {
            tableHeader = json["header"].arrayValue.map { $0.stringValue }
        }
        if tableData?.isEmpty ?? true{
            tableData = json["data"].arrayValue.map { TableData($0) }

        }
            
	}

}
