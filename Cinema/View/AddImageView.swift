//
//  AddImage.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI
import RealmSwift
struct AddImageView: View {
    @State var colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Binding var show :Bool
    @Binding var img :String
    var body: some View {
        ZStack{
            Color("background")
            VStack(spacing:0){
                ZStack{
                    Rectangle().frame(width: UIScreen.main.bounds.width, height: 56, alignment: .center).foregroundColor(Color("garkGrey"))
                    HStack{
                    
                    
                        Spacer()
                        Button(action: {
                            show.toggle()
                        }, label: {
                            Text("Отмена")
                                .foregroundColor(Color("red"))
                                .font(.system( size: 17))
                        })
                    }.padding(.trailing,17)
                    
                    Text("Выбрать иконку")
                        .foregroundColor(Color.white)
                        .font(.system( size: 17))
                }
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: colums,spacing:20, content: {
                   
                        ForEach(0..<37,id:\.self){ i in
                            Button(action: {
                            img = "\(i)"
                                show.toggle()
                            }, label: {
                                Image("\(i)")
                            })
                        }
                   
                }).frame(width: UIScreen.main.bounds.width-30, alignment: .center)
                        .padding(.bottom,100)
                   
                }).padding(.top)
            Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
