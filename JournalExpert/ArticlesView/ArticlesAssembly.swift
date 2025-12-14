//
//  ArticlesAssembly.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import CoreData

class ArticlesAssembly {
    static func build(context: NSManagedObjectContext) -> ArticlesView {
        let checker = SubscriptionChecker(context: context)
        let viewModel = ArticlesViewModel(subscriptionChecker: checker)
        return ArticlesView(
            viewModel: viewModel,
            paywallFactory: {
                let service = SubscriptionService(context: context)

                let paywallVM = PaywallViewModel(
                    subscriptionService: service,
                    onFinish: {
                        if !viewModel.path.isEmpty {
                            viewModel.path.removeLast()
                        }
                    }
                )
                return PayWallView(viewModel: paywallVM)
            }
        )
    }
}
