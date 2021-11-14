//
//  User.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation
import Alamofire

class User: ObservableObject{
    @Published var user = [UserModel]()
    
    func getUser(token: String){
        let url = "http://cinema.areas.su/user"
        let headers: HTTPHeaders = [.authorization(token)]
        AF.request(url, method: .get, headers: headers).validate().responseJSON{ response in
            switch response.result{
            case .success:
                guard let user = try? JSONDecoder().decode([UserModel].self, from: response.data!) else { return }
                self.user = user
                print(self.user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
