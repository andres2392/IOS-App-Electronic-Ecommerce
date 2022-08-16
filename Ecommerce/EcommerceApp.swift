//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by PDWS on 8/16/22.
//

import SwiftUI

@main
struct EcommerceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
