//
//  Login.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class Login: ObservableObject{
    
    func login(email: String, password: String, con: ((_ result: String, _ error: String) -> Void )? = nil){
        let url = "http://cinema.areas.su/auth/login"
        let parameters = ["email":email,
                          "password":password]
        AF.request(url, method: .post, parameters: parameters).validate().responseJSON{ response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let token = json["token"].stringValue
                UserDefaults.standard.setValue(token, forKey: "token")
                con!(token, "Success")
                print(json)
            case .failure(let error):
                con!("", error.localizedDescription)
                print(error.localizedDescription)

            }
        }
    }
    
}
