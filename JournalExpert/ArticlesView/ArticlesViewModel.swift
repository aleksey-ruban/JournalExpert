//
//  ArticlesViewModel.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import Observation

@Observable
final class ArticlesViewModel {
    
    var articles: [Article] = []
    
    var path: [ArticlesRoute] = []
    
    private let subscriptionChecker: ISubscriptionChecker
    
    init(
        subscriptionChecker: ISubscriptionChecker
    ) {
        self.subscriptionChecker = subscriptionChecker
        self.load()
    }
    
    func load() {
        self.articles = Article.mockList()
    }
    
    func onArticleTap(_ article: Article) {
        if subscriptionChecker.hasActiveSubscription() {
            path.append(.article(article))
        } else {
            path.append(.paywall)
        }
    }
    
    func popToRoot() {
        path.removeAll()
    }
}


