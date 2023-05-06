//
//  PlayerStandingWithIDResponse.swift
//  LiveScore
//
//  Created by KHADER on 21/03/2023.
//

import Foundation
import SwiftyJSON

struct PlayerStandingWithIDResponse {

    let list: [PlayerStandingWithID]?

    init(_ json: JSON) {
        list = json["list"].arrayValue.map { PlayerStandingWithID($0) }
    }

}
