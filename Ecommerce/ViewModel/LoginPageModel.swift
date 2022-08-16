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
    
    //MARK: Login Call..
    func Login(){
        
    }
    
    //MARK: Register
    func Register(){
        
    }
    
    //MARK: Forgot Password
    func ForgotPassword(){
        
    }
}

