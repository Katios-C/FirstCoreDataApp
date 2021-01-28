//
//  FirstCoreDataAppApp.swift
//  FirstCoreDataApp
//
//  Created by Екатерина Чернова on 28.01.2021.
//

import SwiftUI

@main
struct FirstCoreDataAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
