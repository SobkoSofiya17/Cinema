//
//  Cover.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class Cover: ObservableObject{
    @Published var cover = [CoverModel]()
    func getCover(){
        let url = "http://cinema.areas.su/movies/cover"
        
        AF.request(url, method: .get).validate().responseJSON{ response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let movieId = json["movieId"].stringValue
                let backgroundImage = json["backgroundImage"].stringValue
                let foregroundImage = json["foregroundImage"].stringValue
                self.cover.append(CoverModel(movieId: movieId, backgroundImage: backgroundImage, foregroundImage: foregroundImage))
               
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
