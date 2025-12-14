//
//  ArticlesView.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import SwiftUI

struct ArticlesView: View {
    
    @Bindable private var viewModel: ArticlesViewModel
    
    private let paywallFactory: () -> PayWallView
    
    init(
        viewModel: ArticlesViewModel,
        paywallFactory: @escaping () -> PayWallView
    ) {
        _viewModel = Bindable(wrappedValue: viewModel)
        self.paywallFactory = paywallFactory
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(viewModel.articles, id: \.id) { article in
                        Button {
                            viewModel.onArticleTap(article)
                        } label: {
                            ArticleCardView(article: article)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
            }
            .listStyle(.plain)
            .navigationTitle("Статьи")
            .navigationDestination(for: ArticlesRoute.self) { route in
                switch route {
                case .article(let article):
                    Text(article.content)
                case .paywall:
                    paywallFactory()
                }
            }
        }
    }
}
