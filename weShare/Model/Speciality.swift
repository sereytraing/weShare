//
//  Speciality.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import Foundation
import ObjectMapper

class Speciality: Mappable {
    var id: Int?
    var title: String?
    var logo: String?
    var createdAt: String?
    var updatedAt: String?
    var userId: Int?
    var contentId: Int?
    
    required init?(map: Map) {
        //no-op
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        logo <- map["logo"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        userId <- map["userId"]
        contentId <- map["contentId"]
    }
}
