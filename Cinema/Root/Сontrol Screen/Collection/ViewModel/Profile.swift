//
//  Profile.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class Profile: ObservableObject {
    @Published var model :[ProfileModel] = []
    init() {
        getPoster()
    }
    func getPoster() {
        let header:HTTPHeaders = [
            "Authorization" : "Bearer \(UserDefaults.standard.string(forKey: "token") ?? "")"
        ]
        let url = "http://cinema.areas.su/user"
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                for i in 0..<json.count{
                self.model.append(ProfileModel(userId: json[i]["userId"].stringValue, firstName: json[i]["firstName"].stringValue, lastName: json[i]["lastName"].stringValue, email: json[i]["email"].stringValue, avatar: json[i]["avatar"].stringValue))
                }
            case .failure(let error):
               
                print(error)
            }
        }
    }
}

