//
//  Region.swift
//  Shake Ball Sports
//
//  Created by Qoo on 13/12/2022.
//

import Foundation
import SwiftyJSON

struct Region {

    let code: String?
    let ip: String?
    let isBanned: Int?

    init(_ json: JSON) {
        code = json["code"].stringValue
        ip = json["ip"].stringValue
        isBanned = json["is_banned"].intValue
    }

}
