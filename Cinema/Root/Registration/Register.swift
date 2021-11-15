//
//  Register.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class Register: ObservableObject{
    
    func register(email: String, password: String, firstName: String, lastName: String){
        let url = "http://cinema.areas.su/auth/register"
        let parameters = ["email": email,
                          "password": password,
                          "firstName": firstName,
                          "lastName": lastName]
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).validate().responseString{ response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
