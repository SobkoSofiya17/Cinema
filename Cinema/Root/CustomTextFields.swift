//
//  CustomTextFields.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text:String
    @State var placeholder:Text
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.init(#colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)))
                .cornerRadius(4)
            Rectangle()
                .foregroundColor(Color("background"))
                .frame(width: UIScreen.main.bounds.width - 34, height: 42)
                .cornerRadius(3.5)
            if text.isEmpty{
                HStack{
                Text("\(placeholder)")
                    .font(.system(size: 14))
                    .foregroundColor(Color.init(#colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)))
                    Spacer()
                }
                .padding(.leading, 16)
            }
            TextField("", text: $text)
                .colorScheme(.dark)
                .padding(.leading, 16)
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 44)
    }
}


struct CustomSecureField: View {
    @Binding var text:String
    @State var placeholder:Text
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.init(#colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)))
                .cornerRadius(4)
            Rectangle()
                .foregroundColor(Color("background"))
                .frame(width: UIScreen.main.bounds.width - 34, height: 42)
                .cornerRadius(3.5)
            if text.isEmpty{
                HStack{
                Text("\(placeholder)")
                    .font(.system(size: 14))
                    .foregroundColor(Color.init(#colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)))
                    Spacer()
                }
                .padding(.leading, 16)
            }
            SecureField("", text: $text)
                .colorScheme(.dark)
                .padding(.leading, 16)
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 44)
    }
}


