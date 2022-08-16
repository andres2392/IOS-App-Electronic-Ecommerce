//
//  LoginPageModel.swift
//  Ecommerce
//
//  Created by PDWS on 8/16/22.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    
    //Login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    //Log Status
    @AppStorage("log_Status") var log_Status : Bool = false
    
    //MARK: Login Call..
    func Login(){
        //Do action here
        withAnimation{
            log_Status = true
        }
    }
    
    //MARK: Register
    func Register(){
        //Do action here
        withAnimation{
            log_Status = true
        }
    }
    
    //MARK: Forgot Password
    func ForgotPassword(){
        
    }
}

