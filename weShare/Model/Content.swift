//
//  Content.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import Foundation
import ObjectMapper

class Content: Mappable {
    var id: Int?
    var title: String?
    var description: String?
    var fileUrl: String?
    var userId: String?
    var createdAt: String?
    var updatedAt: String?
    var specialty: Speciality?
    
    required init?(map: Map) {
        //no-op
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        fileUrl <- map["fileUrl"]
        userId <- map["userId"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        specialty <- map["specialty"]
    }
}
