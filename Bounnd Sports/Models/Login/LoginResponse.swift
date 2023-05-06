//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on February 01, 2023
//
import Foundation
import SwiftyJSON

struct LoginResponse {

	let status: String?
	let code: Int?
	let message: String?
	let data: LoginData?

	init(_ json: JSON) {
		status = json["status"].stringValue
		code = json["code"].intValue
		message = json["message"].stringValue
		data = LoginData(json["data"])
	}

}
