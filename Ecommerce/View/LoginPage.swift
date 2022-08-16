//
//  LoginPage.swift
//  Ecommerce
//
//  Created by PDWS on 8/16/22.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData : LoginPageModel = LoginPageModel()
    
    var body: some View {
        
        //UI User Login and Registration
        VStack{
            
            //Welcome Back text for 3 half of screen
            Text("Welcome\nback")
                .font(.custom(customFont, size: 55).bold())
                .foregroundColor(Color(.white))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
                .background(
                    
                    //Shapes behind Welcome
                    
                    ZStack{
                        //Gradient Circle
                        
                        LinearGradient(colors: [
                            Color("LoginCircle"),
                            Color("LoginCircle")
                                .opacity(0.8),
                            Color("Purple")
                        ], startPoint: .top, endPoint: .bottom)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(.trailing)
                        .offset(y: -25)
                        .ignoresSafeArea()
                        
                        //Small Circle Shapes
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading, 30)
                        
                    }
                
                )
            
            ScrollView(.vertical, showsIndicators: false){
                
                //MARK: Loading Page Form
                VStack(spacing: 15) {
                    
                    Text( loginData.registerUser ? "Register" : "Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Custom Text Field
                    //Email
                    CustomTextField(icon: "envelope", title: "Email", hint: "example@gmail.com", value: $loginData.email, showPassword:.constant(false))
                        .padding(.top, 30)
                    
                    //Password
                    CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top, 10)
                   
                    //Register Reenter Password
                    if loginData.registerUser{
                        
                        CustomTextField(icon: "envelope", title: "Re-Enter Password", hint: "123456", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top, 10)
                    }
                    
                    //Forgot Password Button
                    Button{
                        loginData.ForgotPassword()
                    } label: {
                        Text("Forgot password?")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Login Button
                    Button{
                        if loginData.registerUser{
                            loginData.Register()
                        }
                        else{
                            loginData.Login()
                        }
                    } label: {
                        Text("Login")
                            .font(.custom(customFont, size: 18).bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color("Purple"))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    //Register User Button
                    Button{
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Back to Login" : "Create Account")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(.top, 8)

                }
                .padding(30)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    //Applying Custom Corners..
                    .clipShape(CustomCorners(corners:[.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        
        //Clearing data when change
        //Optional
        .onChange(of: loginData.registerUser) { newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
        }
    }
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>)->some View{
        
        VStack(alignment: .leading, spacing: 12) {
            
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top, 2)
            } else {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        //MARK: Showing Show Button for Password Field
        .overlay(
            
            Group{
                if title.contains("Password"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(Color("Purple"))
                    })
                    .offset(y: 8)
                }
            }
            ,alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
