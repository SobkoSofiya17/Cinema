//
//  Episodes.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class Episodes: ObservableObject{
    @Published var episodes = [EpisodesModel]()
    
    func getEpisode(movieId: String){
        let url = "http://cinema.areas.su/movies/\(movieId)/episodes"
       
        AF.request(url, method: .get).validate().responseJSON{ response in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                for item in 0..<json.arrayValue.count{
                    let name = json[item]["name"].stringValue
                    let description = json[item]["description"].stringValue
                    let year = json[item]["year"].stringValue
                    let preview = json[item]["preview"].stringValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    let episodeId = json[item]["episodeId"].stringValue
                    let images = json[item]["images"].stringValue
                    self.episodes.append(EpisodesModel(episodeId: episodeId, name: name, description: description, director: "", stars: ["String"], year: year, images: [images], runtime: "", preview: preview!, moviesId: ""))
   
                }

            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
