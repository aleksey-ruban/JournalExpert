//
//  OnboardingStorage.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation

protocol IOnboardingStorage: AnyObject {
    var hasSeenOnboarding: Bool { get set }
}

final class OnboardingStorage: IOnboardingStorage {
    private let defaults: UserDefaults
    private let key = "hasSeenOnboarding"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    var hasSeenOnboarding: Bool {
        get { defaults.bool(forKey: key) }
        set { defaults.set(newValue, forKey: key) }
    }
}
