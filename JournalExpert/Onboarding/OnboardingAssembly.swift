//
//  OnboardingAssembly.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation

class OnboardingAssembly {
    
    static public func build(storage: IOnboardingStorage, onFinish: @escaping () -> Void) -> OnboardingView {
        let onboardingViewModel = OnboardingViewModel(storage: storage, onFinish: onFinish)
        return OnboardingView(viewModel: onboardingViewModel)
    }
    
}
