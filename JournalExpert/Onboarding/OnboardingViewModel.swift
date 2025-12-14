//
//  OnboardingViewModel.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import Observation

@Observable
final class OnboardingViewModel {
    enum Page: Int, CaseIterable {
        case first = 0
        case second = 1
    }

    var page: Page = .first

    private let storage: IOnboardingStorage
    private let onFinish: () -> Void

    init(storage: IOnboardingStorage, onFinish: @escaping () -> Void) {
        self.storage = storage
        self.onFinish = onFinish
    }

    func next() {
        if page == .first { page = .second }
    }

    func back() {
        if page == .second { page = .first }
    }

    func finish() {
        storage.hasSeenOnboarding = true
        onFinish()
    }
}
