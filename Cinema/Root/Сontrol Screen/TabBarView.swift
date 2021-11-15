//
//  TabBarView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI

struct RootTabBar: View{
    @State var selectedTab = 1
    var body: some View{
        ZStack{
        if selectedTab == 1{
            MainView()
        } else if selectedTab == 2{
            
        } else if selectedTab == 3{
            СollectionView()
        } else if selectedTab == 4{
            ProfileView()
        }
            TabBarView(selectedTab: $selectedTab)
    }
    }
}

struct TabBarView: View {
    @Binding var selectedTab: Int
    var body: some View {
        VStack{
            Spacer()
        HStack{
            Button(action: {
                withAnimation{
                    selectedTab = 1
                }
            }, label: {
                VStack(spacing: 5){
                    Image("home")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 1 ? Color("red") : Color.init(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)))
                    Text("Главное")
                        .font(.system(size: 10))
                        .foregroundColor(selectedTab == 1 ? Color("red") : Color.init(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)))
                }
            })
         
            Spacer()
            Button(action: {
                withAnimation{
                    selectedTab = 2
                }
            }, label: {
                VStack(spacing: 5){
                    Image("coll")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 2 ? Color("red") : Color.init(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)))
                    Text("Подборка")
                        .font(.system(size: 10))
                        .foregroundColor(selectedTab == 2 ? Color("red") : Color.init(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)))
                }
            })
            Spacer()
            Button(action: {
                withAnimation{
                    selectedTab = 3
                }
            }, label: {
                VStack(spacing: 5){
                    Image("star")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 3 ? Color("red") : Color.init(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)))
                    Text("Коллекции")
                        .font(.system(size: 10))
                        .foregroundColor(selectedTab == 3 ? Color("red") : Color.init(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)))
                }
            })
            Spacer()
            Button(action: {
                withAnimation{
                    selectedTab = 4
                }
            }, label: {
                VStack(spacing: 5){
                    Image("profile")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 4 ? Color("red") : Color.init(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)))
                    Text("Профиль")
                        .font(.system(size: 10))
                        .foregroundColor(selectedTab == 4 ? Color("red") : Color.init(#colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)))
                }
            })
            
        }
        .padding(.bottom, 25)
        .padding(.horizontal, 20)
        .frame(height: 85)
        .background(Color.init(#colorLiteral(red: 0.1098039216, green: 0.1019607843, blue: 0.09803921569, alpha: 1)))
        
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}



struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabBar()
    }
}
