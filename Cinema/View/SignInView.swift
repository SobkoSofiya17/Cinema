//
//  SignInView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI

struct SignInView: View {
    @StateObject var login = Login()
    @Binding var numberPage: Int
    @State var email = "vasya@mail.com"
    @State var password = "qwerty"
    @State var showAlert = false
    @State var msg = ""
    @StateObject var covers = Cover()
    var body: some View {
        ZStack{
            Color("background")
            VStack{
                Spacer()
                VStack(spacing: 16){
                Image("logo")
                    Image("logoText")
                }
                Spacer()
               
                VStack(spacing: 16){
                    CustomTextField(text: $email, placeholder: Text("E-mail"))
               CustomSecureField(text: $password, placeholder: Text("Пароль"))
                }
                .padding(.top)
                Spacer()
                Spacer()
                VStack(spacing: 16){
                    Button(action: {
                        if email != "" && password != ""{
                        login.login(email: email, password: password){token, error in
                            if token != ""{
                                withAnimation{
                                    numberPage = 3
                                }
                                print(UserDefaults.standard.string(forKey: "token") ?? "nul")
                            }
                            else if !error.isEmpty {
                                msg = "Неверный логин или пароль"
                                showAlert.toggle()
                            }
                        }
                        } else {
                            msg = "Заполните все поля"
                            showAlert.toggle()
                        }
                    }, label: {
                        Text("Войти")
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                            .background(Color("red"))
                            .cornerRadius(4)
                    })
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("Ошибка"), message: Text(msg), dismissButton: Alert.Button.default(Text("OK")))
                    })
                    Button(action: {
                        withAnimation{
                        numberPage = 2
                        }
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.init(#colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)))
                                .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                                .background(Color("background"))
                                .cornerRadius(4)
                        Text("Регистрация")
                            .font(.system(size: 14))
                            .foregroundColor(Color("red"))
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width - 34, height: 42)
                            .background(Color("background"))
                            .cornerRadius(3.5)
                           
                        }
                       
                    })
                }
                .padding(.bottom, 44)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(numberPage: .constant(1))
    }
}
