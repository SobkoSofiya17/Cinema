//
//  EpisodesModel.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation

struct EpisodesModel: Hashable, Codable{
    
    var episodeId: String
    var name: String
    var description: String
    var director: String
    var stars: [String]
    var year: String
    var images: [String]
    var runtime: String
    var preview: String
    var moviesId: String
    
}
