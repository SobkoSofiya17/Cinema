//
//  CurrentMovie.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentMovie: ObservableObject{
    
    @Published var movie = [MovieModel]()
    @Published var tags = [Tags]()
    var imageModel: [String] = []
    func getCurrentMovie(movieId: String){
        let url = "http://cinema.areas.su/movies/\(movieId)"
        AF.request(url, method: .get).validate().responseJSON{ response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                let name = json["name"].stringValue
                let description = json["description"].stringValue
                let age = json["age"].stringValue
                let poster = json["poster"].stringValue
                let jsonArray = json["tags"].arrayValue
                for i in 0..<json["images"].arrayValue.count{
                    let image = json["images"][i].stringValue
                    self.imageModel.append(image)
                    print(image)
                }
                for i in 0..<jsonArray.count{
                    let idTags = json["tags"][i]["idTags"].stringValue
                    let tagName = json["tags"][i]["tagName"].stringValue
                    
                    self.tags.append(Tags(idTags: idTags, tagName: tagName))
                    
                }
                self.movie.append(MovieModel(movieId: movieId, name: name, description: description, age: age, images: self.imageModel, tags: self.tags, poster: poster))

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
