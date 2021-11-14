//
//  AddCollectionView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI
import RealmSwift
struct AddCollectionView: View {
    @State var title = ""
    @State var show = false
    let realm = try! Realm()
//    @State var item = try! Realm().objects(CollectionModel.self)
    @State var img = ""
    @Binding var item:Results<CollectionModel>
    @State var errorAlert = false
    @Binding var showMe:Bool
    var body: some View {
        ZStack{
            Color("background")
            VStack(spacing:0){
                ZStack{
                    HStack{
                        Button(action: {
                            
                            showMe.toggle()
                            
                        }, label: {
                            Image("arr")
                        }).padding(.leading,17)
                    
                        Spacer()
                      
                    }.padding(.leading,8)
                    Text("Создать коллекцию")
                        .foregroundColor(Color.white)
                        .font(.system( size: 17))
                }.padding(.bottom,19)
               CustomTextField(text: $title, placeholder: Text("Название"))
                HStack(spacing:24){
                    Image(img)
                        .resizable()
                        .frame(width: 72, height: 72, alignment: .center)
                    Button(action: {
                        show.toggle()
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 4)
                                .strokeBorder(Color("gray"))
                                .frame(width: 270, height: 44, alignment: .center)
                            Text("Выбрать иконку")
                                .foregroundColor(Color("red"))
                                .font(.system( size: 14))
                        }
                    })
                }.padding(.top,16)
                Button(action: {
                    if title != "" && img != ""{
                    let add = CollectionModel()
                    add.name = title
                    add.image =  img
                    try! realm.write{
                        realm.add(add)
                    }
                    item = realm.objects(CollectionModel.self)
                    }else{
                        errorAlert.toggle()
                    }
                    showMe.toggle()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 4).frame(width: 370, height: 44, alignment: .center).foregroundColor(Color("red"))
                        Text("Сохранить").foregroundColor(Color.white
                        ).font(.system( size: 14))
                    }
                }).padding(.top,57).alert(isPresented: $errorAlert, content: {
                    Alert(title: Text("Error"), message: Text("Заполните поле названия и выбирите иконку"), dismissButton: .default(Text("Ok")))
                })
                Spacer()
            }.offset(x: 0, y: 50)
        }.edgesIgnoringSafeArea(.all).sheet(isPresented: $show, content: {
            AddImageView(show: $show, img: $img)
        })
    }
}
