//
//  ProfileView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    @StateObject var model = Profile()
    @State var image :UIImage?
    @State var show = false
    @State var imageName = ""
    
    var body: some View {
        ZStack{
            Color("background")
            VStack(spacing:0){
                VStack(alignment:.leading){
                    HStack(alignment:.top,spacing:16){
                        if imageName != ""{
                            Image(uiImage:Helper().loadImageFromDocumentDirectory(nameOfImage: "\(imageName)")).resizable().frame(width: 88, height: 88, alignment: .center).mask(
                                                    Circle().frame(width: 88, height: 88, alignment: .center))

                        }
                        
                     
                        VStack(alignment:.leading){
                            HStack(spacing:3){
                            Text("\(model.model.first?.firstName ?? "")").foregroundColor(Color.white).font(.system( size: 24))
                                Text("\(model.model.first?.lastName ?? "")").foregroundColor(Color.white).font(.system( size: 24))
                            }
                         
                            Text("\(model.model.first?.email ?? "")").foregroundColor(Color("gray")).font(.system( size: 14))
                        }
                      
                    }
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        Text("Изменить").foregroundColor(Color("red")).font(.system( size: 14))
                    })
                }.padding(.leading,16)
          
              
            }
        }.fullScreenCover(isPresented: $show, content: {
            ImagePickerView(image: $image, imageName: $imageName, isPresented:$show)
        }).edgesIgnoringSafeArea(.all).onAppear {
            imageName = UserDefaults.standard.string(forKey: "imageName") ?? ""
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
