//
//  Category.swift
//  Ball pie Sports
//
//  Created by KHADER on 25/03/2023.
//

import Foundation

class CategoryList{
    
    
    let id:Int?
    let name:String?
    let name_s:String?
    let image:String?
    
    
        init(id:Int,name:String,name_s:String,image:String){
            self.id = id
            self.name = name
            self.name_s = name_s
            self.image = image
        }
    
        static var categories:[CategoryList]?
    
        static func populateCategoriesList(){
            if categories?.count ?? 0 == 0{
            let ids = [0,
                       34
                       ,8
                       ,11
                       
                       ,192
                       
                       ]
                
                let names = ["E-Sports".localized,
                             "Hockey".localized,
                             "Handball".localized
                             , "Tennis".localized
                             , "Volleyball".localized
                             ]
                
                let names_use_in_search = [
                    "esports".localized,
                             "hockey".localized,
                             "handball".localized
                             
                             , "tennis".localized
                             , "volleyball".localized
                             ]
                
            let images = [ "ESportsIcon",
                           "tenis_ic"
                          , "hockey_ic"
                          , "handball_ic"
                          
                          , "football_ic"
                           ]
                
            var categoriesList = [CategoryList]()
                
            for i in 0 ... ids.count - 1{
                let obj = CategoryList(id: ids[i], name: names[i],name_s: names_use_in_search[i], image: images[i])
                categoriesList.append(obj)
            }
                CategoryList.categories = categoriesList
            }
        }
        
       
    
}
