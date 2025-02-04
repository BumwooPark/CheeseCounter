//
//  UserRegisterResult.swift
//  CheeseCounter
//
//  Created by xiilab on 2017. 3. 20..
//  Copyright © 2017년 xiilab. All rights reserved.
//

import ObjectMapper

struct UserRegisterResult: Mappable {
    
    var code: String?
    var data: data?
    
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.code <- map["result.code"]
        self.data <- map["result.data"]
    }
    
    struct data: Mappable {
        
        var addr1: String?
        var addr2: String?
        var age: Int?
        var birthYear: Int?
        var created: String?
        var fcm_token: String?
        var gender: String?
        var id: String?
        var img_url: String?
        var isEnable: String?
        var level: String?
        var nickname: String?
        var type: String?
        
        init?(map: Map) {
        }
        
        mutating func mapping(map: Map) {
            self.addr1 <- map["addr1"]
            self.addr2 <- map["addr2"]
            self.age <- map["age"]
            self.birthYear <- map["birth_year"]
            self.created <- map["created_date"]
            self.fcm_token <- map["fcm_token"]
            self.gender <- map["gender"]
            self.id <- map["id"]
            self.img_url <- map["img_url"]
            self.isEnable <- map["is_enable"]
            self.level <- map["level"]
            self.nickname <- map["nickname"]
            self.type <- map["type"]
        }
    }
}
