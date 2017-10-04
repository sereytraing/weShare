//
//  NSObject.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import Foundation
extension NSObject{
    static func className()-> String{
        return String(describing: self)
    }
}
