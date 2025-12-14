//
//  PayWallAssembly.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import CoreData

class PaywallAssembly {
    static func build(context: NSManagedObjectContext, onFinish: @escaping () -> Void) -> PayWallView {
        let service = SubscriptionService(context: context)
        let viewModel = PaywallViewModel(subscriptionService: service, onFinish: onFinish)
        return PayWallView(viewModel: viewModel)
    }
}
