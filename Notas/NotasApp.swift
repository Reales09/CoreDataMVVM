//
//  NotasApp.swift
//  Notas
//
//  Created by Reales Rectoro Myles Clarence on 5/04/24.
//

import SwiftUI

@main
struct NotasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
