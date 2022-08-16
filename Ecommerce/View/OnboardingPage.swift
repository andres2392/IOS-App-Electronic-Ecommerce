//
//  OnboardingPage.swift
//  Ecommerce
//
//  Created by PDWS on 8/16/22.
//

import SwiftUI

//To Use the custom font on all pages..
let customFont = "Raleway-Regular"

struct OnboardingPage: View {
    //Showing Login Page..
    @State var showLoginPage: Bool = false
    
    var body: some View {
     
        VStack(alignment: .leading){
           
            Text("Find your \nGadget")
                .font(.custom(customFont, size: 55))
            //Since we addedd all three font in Info.plist
            //we can call all of those fronts with any names
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image("OnBoard")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button{
                withAnimation{
                    showLoginPage = true
                }
            }label: {
                Text("Get started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal,30)
            //Adding some Adjusments for large Display Devices
            .offset(y: getRect().height < 750 ? 20 : 40)
            
            Spacer()
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 20 : 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
        Color("Purple")
        )
        .overlay(
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage()
        
    }
}


//Extending view to get Screen Bounds
extension View{
    func getRect ()->CGRect{
        return UIScreen.main.bounds
    }
}
