//
//  ResponseLogin.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseLogin: Mappable {
    var user: User?
    var token: String?
    
    required init?(map: Map) {
        //no-op
    }
    
    func mapping(map: Map) {
        user <- map["user"]
        token <- map["token"]
    }
}
