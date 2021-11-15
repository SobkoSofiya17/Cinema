//
//  ChangeAvatar.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class ChangeAvatar: ObservableObject {
    func upload(image:UIImage) {
        let url = "http://cinema.areas.su/user/avatar"
        let params = UserDefaults.standard.string(forKey: "token") ?? ""
        let headers:HTTPHeaders = [
            "Accept": "application/json"
        ]
        let img = image.pngData()
        AF.upload(multipartFormData: { MultipartFormData in
            MultipartFormData.append(params.data(using: .utf8)!, withName: "token")
            MultipartFormData.append(img!, withName: "file", fileName: "avatar.png", mimeType: "image/png")
        }, to: url, usingThreshold: UInt64.init(), method: .post, headers: headers).responseString { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
