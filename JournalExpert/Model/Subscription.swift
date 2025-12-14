//
//  Subscription.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import CoreData

@objc(Subscription)
public final class Subscription: NSManagedObject { }

extension Subscription {
    
    public enum SubscriptionType: Int16, CaseIterable {
        case monthly = 0
        case yearly = 1
        
        var title: String {
            switch self {
            case .monthly: return "Месячная"
            case .yearly:  return "Годовая"
            }
        }
    }
    
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<Subscription> {
        NSFetchRequest<Subscription>(entityName: "Subscription")
    }

    @NSManaged public var startDate: Date
    @NSManaged public var endDate: Date
    @NSManaged public var isActive: Bool
    @NSManaged public var typeRaw: Int16

    public var type: SubscriptionType {
        get { SubscriptionType(rawValue: typeRaw) ?? .monthly }
        set { typeRaw = newValue.rawValue }
    }
}
