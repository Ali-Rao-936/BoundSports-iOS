//
//  UserInfo.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on February 08, 2023
//
import Foundation
import SwiftyJSON

struct UserInfo {

	let uid: Int?
	let name: String?
	let username: String?
	let dob: String?
	let profilepic: String?
	let token: String?

	init(_ json: JSON) {
		uid = json["uid"].intValue
		name = json["name"].stringValue
		username = json["username"].stringValue
		dob = json["dob"].stringValue
		profilepic = json["profilepic"].stringValue
		token = json["token"].stringValue
	}
    
    func toDictionary() -> [String:Any]{
        var dict = [String:Any]()
        dict["uid"] = uid
        dict["name"] = name
        dict["username"] = username
        dict["dob"] = dob
        dict["profilepic"] = profilepic
        dict["token"] = token
        return dict
    }

}
