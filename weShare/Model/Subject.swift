//
//  Subject.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import Foundation
import ObjectMapper

class Subject: Mappable {
    var name: String?
    
    required init?(map: Map) {
        //no-op
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}
