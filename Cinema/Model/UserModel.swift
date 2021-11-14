//
//  UserModel.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation

struct UserModel: Hashable, Codable{
    
    var userId: String
    var firstName: String
    var lastName: String
    var email: String
    var avatar: String
    
}
