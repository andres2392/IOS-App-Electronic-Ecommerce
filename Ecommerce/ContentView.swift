//
//  ContentView.swift
//  Ecommerce
//
//  Created by PDWS on 8/16/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //Log Status
    @AppStorage("log_Status") var log_Status : Bool = false
    var body: some View {
        Group{
            if log_Status{
                MainPage()
            }
            else{
                OnboardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
