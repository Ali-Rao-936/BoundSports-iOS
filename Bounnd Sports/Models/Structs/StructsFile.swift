//
//  StructsFile.swift
//  LiveScore
//
//  Created by KHADER on 26/01/2023.
//

import Foundation

struct datesForSearch{
    var date_for_show: String
    var date_for_search: String
    var name_of_day:String
    
    init(date_for_show:String,date_for_search:String,name_of_day:String){
        self.date_for_show = date_for_show
        self.date_for_search = date_for_search
        self.name_of_day = name_of_day
    }
}
