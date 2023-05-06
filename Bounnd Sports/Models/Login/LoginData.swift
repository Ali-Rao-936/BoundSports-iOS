//
//  Data.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on February 01, 2023
//
import Foundation
import SwiftyJSON

struct LoginData {
    let userInfo: UserInfo?
	

	init(_ json: JSON) {
        userInfo = UserInfo(json["userInfo"])
	}

}
