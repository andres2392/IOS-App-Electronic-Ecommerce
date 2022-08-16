//
//  SearchView.swift
//  Ecommerce
//
//  Created by Andres Gonzalez on 8/16/22.
//

import SwiftUI

struct SearchView: View {
    var animation: Namespace.ID
    
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        
        VStack(spacing: 0){
            
            //Search Bar
            HStack(spacing: 20){
                
                //Close Button
                Button{
                    
                }label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("HomeBG")
                .ignoresSafeArea()
        )
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
