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
    
    required init?(map: Map) {
        //no-op
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
    }
}

