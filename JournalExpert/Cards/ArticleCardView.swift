//
//  ArticleCardView.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import SwiftUI

struct ArticleCardView: View {
    
    let article: Article
        
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(article.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
            
            Text(article.content)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(3)
            
            HStack(spacing: 8) {
                Text(formattedDate)
                Spacer()
                Text("\(article.readTimeMinutes) мин")
                    
            }
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.black)
        }
        .padding(18)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.08), radius: 14, x: 0, y: 2)
    }
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: article.date)
    }
}
