//
//  SubscriptionService.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import CoreData

protocol ISubscriptionService {
    func activate(plan: SubscriptionPlan, now: Date) async throws
}

final class SubscriptionService: ISubscriptionService {
    private let context: NSManagedObjectContext
    private let calendar: Calendar

    init(context: NSManagedObjectContext, calendar: Calendar = .current) {
        self.context = context
        self.calendar = calendar
    }

    func activate(plan: SubscriptionPlan, now: Date) async throws {
        let sub = Subscription(context: context)
        sub.isActive = true
        sub.startDate = now

        switch plan.id {
        case .monthly:
            sub.endDate = calendar.date(byAdding: .month, value: 1, to: now) ?? now
            sub.type = .monthly
        case .yearly:
            sub.endDate = calendar.date(byAdding: .year, value: 1, to: now) ?? now
            sub.type = .yearly
        }

        try await context.perform { [weak self] in
            guard let self else { return }
            try self.context.save()
        }
    }
}
