//
//  ContentView.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var onboardingStorage = OnboardingStorage()
    @State private var hasSeenOnboarding: Bool
    
    init() {
            let storage = OnboardingStorage()
            self.onboardingStorage = storage
            _hasSeenOnboarding = State(initialValue: storage.hasSeenOnboarding)
        }

    var body: some View {
        Group {
            if hasSeenOnboarding {
                ArticlesAssembly.build(context: viewContext)
            } else {
                OnboardingAssembly.build(
                    storage: onboardingStorage,
                    onFinish: {
                        hasSeenOnboarding = true
                    }
                )
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
