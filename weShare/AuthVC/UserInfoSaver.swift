//
//  UserInfoSaver.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import Foundation
import Alamofire

class UserInfoSaver {
    let userDefaults: UserDefaults?
    
    init() {
        userDefaults = UserDefaults.standard
    }
    
    func getUserId() -> Int? {
        if let idUser = userDefaults?.string(forKey: "id_user") {
            return Int(idUser)
        }
        return nil
    }
    
    func getUsername() -> String? {
        if let username = userDefaults?.string(forKey: "username") {
            return username
        }
        return nil
    }
    
    func getToken() -> String? {
        if let token = userDefaults?.string(forKey: "token") {
            return token
        }
        return nil
    }
    
    func saveUser(id: Int?, username: String?, token: String?) {
        self.userDefaults?.set(id, forKey: "id_user")
        self.userDefaults?.set(username, forKey: "username")
        self.userDefaults?.set(token, forKey: "token")
        self.userDefaults?.synchronize()
    }
    
    func isAuth() -> Bool {
        if let token = userDefaults?.string(forKey: "token") {
            return true
        }
        return false
    }
    
    func disconnectAccount() {
        userDefaults?.removeObject(forKey: "id_user")
        userDefaults?.removeObject(forKey: "username")
        userDefaults?.removeObject(forKey: "token")
    }
}
