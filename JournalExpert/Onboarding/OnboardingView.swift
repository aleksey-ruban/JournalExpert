//
//  OnboardingView.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @Bindable private var viewModel: OnboardingViewModel

    init(viewModel: OnboardingViewModel) {
        _viewModel = Bindable(wrappedValue: viewModel)
    }

    var body: some View {
        TabView(selection: $viewModel.page) {
            pageOne
                .tag(OnboardingViewModel.Page.first)

            pageTwo
                .tag(OnboardingViewModel.Page.second)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .padding(16)
        .padding(.bottom, 34)
    }

    private var pageOne: some View {
        VStack(alignment: .leading, spacing: 14) {
            Spacer()

            Text("Добро пожаловать")
                .font(.title).bold()

            Text("Читайте статьи и сохраняйте фокус на главном.")
                .font(.body)
                .foregroundStyle(.secondary)

            Spacer()

            Button {
                viewModel.next()
            } label: {
                Text("Далее")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
        }
    }

    private var pageTwo: some View {
        VStack(alignment: .leading, spacing: 14) {
            Spacer()

            Text("Подписка открывает доступ")
                .font(.title).bold()

            Text("Оформите подписку, чтобы читать все материалы без ограничений.")
                .font(.body)
                .foregroundStyle(.secondary)

            Spacer()

            HStack(spacing: 12) {
                Button {
                    viewModel.back()
                } label: {
                    Text("Назад")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Button {
                    viewModel.finish()
                } label: {
                    Text("Продолжить")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}
