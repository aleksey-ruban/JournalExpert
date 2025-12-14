//
//  Persistence.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        return result
    }()

    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        let modelName = "JournalExpert"

        let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd")
        let model = modelURL.flatMap(NSManagedObjectModel.init(contentsOf:))

        if let model {
            container = NSPersistentContainer(name: modelName, managedObjectModel: model)
        } else {
            container = NSPersistentContainer(name: modelName) // fallback
        }

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
