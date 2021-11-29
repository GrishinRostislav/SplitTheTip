//
//  StyleForRows.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 29.11.2021.
//

import SwiftUI

struct StyleForRows: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: 4)
                    .shadow(color: Color.gray.opacity(0.5), radius:4, x: 0, y: 0)
            )
            .padding(.horizontal, 15)
    }
}

extension View {
    func rowStyle() -> some View {
        modifier(StyleForRows())
    }
}
