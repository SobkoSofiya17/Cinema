//
//  RootView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI

struct RootView: View {
    @State var numberPage = UserDefaults.standard.string(forKey: "isOpenned") == "openned" ? 1 : 2
    var body: some View {
        ZStack{
            Color("background")
        if numberPage == 1{
            SignInView(numberPage: $numberPage)
               
        } else if numberPage == 2{
            SignUpView(numberPage: $numberPage)
                
        } else if numberPage == 3{
           RootTabBar()
        }
        }.edgesIgnoringSafeArea(.all)

    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
