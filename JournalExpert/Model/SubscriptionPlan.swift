//
//  SubscriptionPlan.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation

struct SubscriptionPlan: Identifiable, Equatable {
    let id: Subscription.SubscriptionType
    let title: String
    let subtitle: String
    let priceText: String
    let discountText: String?
}
