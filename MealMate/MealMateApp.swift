//
//  MealMateApp.swift
//  MealMate
//
//  Created by Sashminda on 2025-04-11.
//

import SwiftUI

@main
struct MealMateApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
