//
//  Movie.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class Movie: ObservableObject{
    
    @Published var new = [MovieModel]()
    @Published var inTrend = [MovieModel]()
    @Published var forMe = [MovieModel]()
    func getMovie(filter: String){
        let url = "http://cinema.areas.su/movies?filter=\(filter)"
        AF.request(url, method: .get).validate().responseJSON{ response in
            switch response.result{
            case .success:
                guard let movie = try? JSONDecoder().decode([MovieModel].self, from: response.data!) else { return }

                self.new = movie
                self.forMe = movie
                self.inTrend = movie
                
            case.failure(let error):
                print(error)
            }
        }
    }
    
}
