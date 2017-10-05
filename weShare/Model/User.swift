//
//  User.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var id: Int?
    var username: String?
    var classe: String?
    var opens: Int?
    var specialties: [Specialty]?
    var contents: [Content]?
    
    required init?(map: Map) {
        //no-op
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        specialties <- map["specialties"]
        contents <- map["contents"]
        opens <- map["opens"]
        classe <- map["class"]
    }
}

