//
//  PayWallView.swift
//  JournalExpert
//
//  Created by Aleksey Ruban on 14.12.2025.
//

import Foundation
import SwiftUI

struct PayWallView: View {
    
    @Bindable private var viewModel: PaywallViewModel

    init(viewModel: PaywallViewModel) {
        _viewModel = Bindable(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                header
                
                plansList
            }
            .padding(.bottom, 0)
        }
        .padding(16)
        .navigationTitle("Подписка")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 0) {
                Divider()

                Button {
                    viewModel.continueTapped()
                } label: {
                    HStack {
                        Spacer()
                        if viewModel.isProcessing {
                            ProgressView().tint(.white)
                        } else {
                            Text("Продолжить")
                                .font(.headline)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 14)
                }
                .disabled(viewModel.selectedPlan == nil || viewModel.isProcessing)
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
            }
            .background(.ultraThinMaterial)
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Подписка")
                .font(.title2).bold()

            Text("Выберите план, чтобы открыть доступ к статьям.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var plansList: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.plans) { plan in
                Button {
                    viewModel.select(plan)
                } label: {
                    SubscriptionCardView(
                        plan: plan,
                        isSelected: viewModel.selectedPlan == plan
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
}
