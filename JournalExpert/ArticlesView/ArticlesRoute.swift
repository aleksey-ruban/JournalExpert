//
//  ArticlesRoute.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation

enum ArticlesRoute: Identifiable, Hashable {
    case article(Article)
    case paywall

    var id: String {
        switch self {
        case .article(let article):
            return "article-\(article.id)"
        case .paywall:
            return "paywall"
        }
    }
}
