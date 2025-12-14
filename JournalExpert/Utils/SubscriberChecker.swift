//
//  SubscriberChecker.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import CoreData

protocol ISubscriptionChecker {
    func hasActiveSubscription() -> Bool
}

final class SubscriptionChecker: ISubscriptionChecker {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func hasActiveSubscription() -> Bool {
        let request: NSFetchRequest<Subscription> = Subscription.fetchRequest()
        let now = Date()
        
        request.fetchLimit = 1
        request.predicate = NSPredicate(
            format: "isActive == YES AND startDate <= %@ AND endDate >= %@",
            now as NSDate,
            now as NSDate
        )
        
        do {
            let result = try context.count(for: request)
            return result > 0
        } catch {
            return false
        }
    }
}
