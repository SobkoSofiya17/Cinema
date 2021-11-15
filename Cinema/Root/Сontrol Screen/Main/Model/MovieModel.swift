//
//  MovieModel.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation


struct MovieModel: Hashable, Codable{
    
    var movieId: String
    var name: String
    var description: String
    var age: String
    var images: [String]
    var tags: [Tags]
    var poster: String
    
}
struct Tags: Hashable, Codable{
    var idTags: String
    var tagName: String
}


