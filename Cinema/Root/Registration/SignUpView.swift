//
//  SignUpView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI

struct SignUpView: View {
    @Binding var numberPage: Int
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var surName = ""
    @State var rePassword = ""
    @State var showAlerts = false
    @State var message = ""
    @State var titleAlert = ""
    @StateObject var register = Register()
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
                Spacer()
                VStack(spacing: 16){
                    CustomTextField(text: $name, placeholder: Text("Имя"))
                    CustomTextField(text: $surName, placeholder: Text("Фамилия"))
                    CustomTextField(text: $email, placeholder: Text("E-mail"))
                    CustomTextField(text: $name, placeholder: Text("Имя"))
                    CustomSecureField(text: $password, placeholder: Text("Пароль"))
                    CustomSecureField(text: $rePassword, placeholder: Text("Повторите пароль"))
                }
                Spacer()
                Spacer()
                VStack(spacing: 16){
                    Button(action: {
                        if email != "" && name != "" && password != "" && surName != "" && rePassword != ""{
                            if !email.contains("@"){
                                showAlerts.toggle()
                                message = "Email должен включать символ '@'"
                                titleAlert = "Ошибка"
                            } else {
                            if password == rePassword{
                                register.register(email: email, password: password, firstName: name, lastName: surName)
                                showAlerts.toggle()
                                message = "Регистрация успешно завершена! Пожалуйста, авторизуйтесь"
                                titleAlert = "Успех"
                            }
                            else if password != rePassword{
                                showAlerts.toggle()
                                message = "Пароли не совпадают"
                                titleAlert = "Ошибка"
                            }
                            }
                        }
                    
                    
                    else {
                            showAlerts.toggle()
                            message = "Заполните все поля"
                        titleAlert = "Ошибка"
                        }
                    }, label: {
                        Text("Зарегистрироваться")
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                            .background(Color("red"))
                            .cornerRadius(4)
                    })
                    .alert(isPresented: $showAlerts, content: {
                        Alert(title: Text(titleAlert), message: Text(message), dismissButton: message == "Регистрация успешно завершена! Пожалуйста, авторизуйтесь" ? Alert.Button.default(Text("OK"), action: {
                                withAnimation{
                                    numberPage = 1
                                }
                        }) : Alert.Button.default(Text("OK")))
                    })
                    Button(action: {
                        withAnimation{
                        numberPage = 1
                        }
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.init(#colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)))
                                .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                                .background(Color("background"))
                                .cornerRadius(4)
                        Text("У меня уже есть аккаунт")
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
        .onAppear(perform: {
            UserDefaults.standard.setValue("openned", forKey: "isOpenned")
        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(numberPage: .constant(2))
    }
}
