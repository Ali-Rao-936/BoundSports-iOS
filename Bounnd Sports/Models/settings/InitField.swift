//
//  InitField.swift
//  Shake Ball Sports
//
//  Created by Qoo on 13/12/2022.
//

import Foundation
import SwiftyJSON

struct InitField {

    let openType: String?
    let redirectUrl: String?

    init(_ json: JSON) {
        openType = json["open_type"].stringValue
        redirectUrl = json["redirect_url"].stringValue
    }

}
