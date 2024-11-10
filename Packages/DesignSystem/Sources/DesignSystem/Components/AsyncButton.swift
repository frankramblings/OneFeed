//
//  AsyncButton.swift
//  DesignSystem
//
//  Created by Frank Emanuele on 2/3/25.
//


import SwiftUI

public struct AsyncButton<Label: View>: View {
    let action: () async throws -> Void
    let label: Label
    @State private var isPerformingTask = false
    
    public init(action: @escaping () async throws -> Void, @ViewBuilder label: () -> Label) {
        self.action = action
        self.label = label()
    }
    
    public var body: some View {
        Button(action: {
            Task {
                isPerformingTask = true
                try? await action()
                isPerformingTask = false
            }
        }) {
            label
                .opacity(isPerformingTask ? 0.5 : 1.0)
        }
        .disabled(isPerformingTask)
    }
}

public extension AsyncButton where Label == Text {
    init(_ title: String, action: @escaping () async throws -> Void) {
        self.init(action: action) {
            Text(title)
        }
    }
}