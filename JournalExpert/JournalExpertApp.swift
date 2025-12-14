//
//  JournalExpertApp.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import SwiftUI
import CoreData

@main
struct JournalExpertApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
