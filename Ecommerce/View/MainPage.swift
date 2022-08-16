//
//  MainPage.swift
//  Ecommerce
//
//  Created by PDWS on 8/16/22.
//

import SwiftUI

struct MainPage: View {
    //Current tab
    @State var currentTab: Tab = .Home
    
    //Hiding Tab Bar
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack(spacing: 0){
            //Tab view
            TabView(selection: $currentTab){
                
                Home()
                    .tag(Tab.Home)

                Text("Liked")
                    .tag(Tab.Liked)

                Text("Profile")
                    .tag(Tab.Profile)

                Text("Cart")
                    .tag(Tab.Cart)
            }
            //MARK: Custom Tab Bar
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.self){tab in
                    Button{
                        //Updating Tab
                        currentTab = tab
                        
                    }label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            //applying little shadow at bg
                            .background(
                            
                                Color("Purple")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("Purple") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        .background(Color("HomeBG").ignoresSafeArea())
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

//MARK: Tab cases
enum Tab: String, CaseIterable {
    
    //Raw values must be image name in asset
    case Home = "Home"
    case Liked = "Liked"
    case Profile = "Profile"
    case Cart = "Cart"
}
