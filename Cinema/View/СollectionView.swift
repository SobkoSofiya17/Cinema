//
//  СollectionView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI
import RealmSwift

struct СollectionView: View {
    let realm = try! Realm()
    @State var item = try! Realm().objects(CollectionModel.self)
    @State var addCollection = false
    var body: some View {
        ZStack{
            Color("background")
            VStack(spacing:0){
                ZStack{
                    HStack{
                       
                        Spacer()
                        Button(action: {
                            addCollection.toggle()
                        }, label: {
                            Image("plus")
                        }).padding(.trailing,17)
                     
                    }.padding(.leading,12)
                    Text("Коллекции")
                        .foregroundColor(Color.white)
                        .font(.system( size: 17))
                }.padding(.bottom,19)
                ForEach(0..<item.count,id:\.self){ i in
                    Button(action: {
                     
                    }, label: {
                        HStack(spacing:0){
                            Image("\(item[i].image)")
                                .resizable()
                                .frame(width: 44, height: 44, alignment: .center)
                                .padding(.leading,22)
                            Text("\(item[i].name)")
                                .foregroundColor(Color.white)
                                .font(.system( size: 14))
                                .padding(.leading,30)
                            Spacer()
                            Image("arr")
                                .padding(.trailing,16)
                        }
                    }).frame(width: UIScreen.main.bounds.width, height: 70, alignment: .center)
                }
            Spacer()
            }.offset(x: 0, y: 50)
        }.fullScreenCover(isPresented: $addCollection, content: {
            AddCollectionView(item: $item, showMe: $addCollection)
        }).edgesIgnoringSafeArea(.all)
    }
}

struct Collection_Previews: PreviewProvider {
    static var previews: some View {
        СollectionView()
    }
}
