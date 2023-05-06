//
//  FootballLeague.swift
//  775775Sports
//
//  Created by Remya on 9/9/22.
//

import Foundation

class FootballLeague{
    let id:Int?
    let name:String?
    let image:String?
        init(id:Int,name:String,image:String){
            self.id = id
            self.name = name
            self.image = image
        }
        static var leagues:[FootballLeague]?

    // ,60 , "Chinese Super League".localized   //244   ,"America's Cup".localized
    
        static func populateFootballLeagues(){
            if leagues?.count ?? 0 == 0{
            let ids = [36
                       ,31
                       ,34
                       ,8
                       ,11
                       
                       ,192
                       ,648
                       ,652
                       ,650
                       ,75,
                       67,
                       88,
                       ]
                
            let names = ["Premier League".localized,
                         "La Liga".localized,
                         "Serie A".localized,
                         "Bundesliga".localized,
                         "Ligue 1".localized
                         
                         , "AFC Champions League".localized
                         , "Asian Qualifiers".localized
                         , "South American Qualifier".localized
                         , "European Qualifier".localized
                         , "World Cup".localized
                         , "European Cup".localized
                         , "Confederations Cup".localized
                         ]
                
            let images = ["premier"
                          , "laliga"
                          , "serieA"
                          , "bundesliga"
                          , "League1"
                          , "AFC"
                          ,"Asian_Qualifiers"
                          , "SouthAmerican"
                          , "EuropeanQualifier"
                          , "confederations_cup"
                          , "EuropeanCup"
                          , "confederations_cup"
                           ]
                
            var leagues = [FootballLeague]()
                
            for i in 0 ... ids.count - 1{
                let obj = FootballLeague(id: ids[i], name: names[i], image: images[i])
                leagues.append(obj)
            }
            FootballLeague.leagues = leagues
            }
        }
        
       
    
}
