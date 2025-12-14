//
//  Article.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation

struct Article: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let content: String
    let date: Date
    let readTimeMinutes: Int
}

extension Article {
    static func mockList() -> [Article] {
        let calendar = Calendar.current

        let d1 = calendar.date(from: DateComponents(year: 2025, month: 12, day: 10)) ?? Date()
        let d2 = calendar.date(from: DateComponents(year: 2025, month: 11, day: 28)) ?? Date()
        let d3 = calendar.date(from: DateComponents(year: 2025, month: 10, day: 3)) ?? Date()

        return [
            Article(
                title: "Как устроен MVVM в SwiftUI на практике",
                content: "MVVM помогает отделить логику от представления и упрощает тестирование. В SwiftUI это особенно удобно благодаря биндингам и реактивным обновлениям. Начинать лучше с простого ViewModel, который отдает готовые данные для экрана.",
                date: d1,
                readTimeMinutes: 6
            ),
            Article(
                title: "Список статей: сортировка, фильтрация и поиск",
                content: "Главный экран со статьями обычно требует сортировки по дате и быстрых фильтров. Поиск проще поддерживать, если хранить исходный массив и отдавать в UI уже отфильтрованный. Для плавного UX полезно дебаунсить ввод в строке поиска.",
                date: d2,
                readTimeMinutes: 5
            ),
            Article(
                title: "Экран подписки: месяц или год",
                content: "Экран подписки должен четко показывать разницу между планами и итоговую стоимость. Пользователю важно видеть, что именно он получит после оплаты и как отменить подписку. Хорошая практика — добавлять короткий блок с ответами на частые вопросы.",
                date: d3,
                readTimeMinutes: 4
            )
        ]
    }
}
