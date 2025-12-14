//
//  PayWallViewModel.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import Observation

@Observable
final class PaywallViewModel {
    var plans: [SubscriptionPlan]
    var selectedPlan: SubscriptionPlan?

    var isProcessing = false
    var didFinishPayment = false
    
    private let onFinish: () -> Void

    private let subscriptionService: ISubscriptionService

    init(subscriptionService: ISubscriptionService, onFinish: @escaping () -> Void) {
        self.subscriptionService = subscriptionService

        self.plans = [
            SubscriptionPlan(
                id: .monthly,
                title: "Месячная подписка",
                subtitle: "Полный доступ ко всем статьям",
                priceText: "199 ₽ / месяц",
                discountText: nil
            ),
            SubscriptionPlan(
                id: .yearly,
                title: "Годовая подписка",
                subtitle: "Полный доступ ко всем статьям",
                priceText: "1 199 ₽ / год",
                discountText: "−40%"
            )
        ]
        
        self.onFinish = onFinish
    }

    func select(_ plan: SubscriptionPlan) {
        selectedPlan = plan
    }

    func continueTapped() {
        guard let selectedPlan else { return }

        isProcessing = true

        Task { @MainActor in
            try? await Task.sleep(for: .seconds(1.0))

            do {
                try await subscriptionService.activate(plan: selectedPlan, now: Date())
                onFinish()
            } catch {
                let nsError = error as NSError
                print("CoreData save error:", nsError)
                print("userInfo:", nsError.userInfo)
            }

            isProcessing = false
        }
    }
}
