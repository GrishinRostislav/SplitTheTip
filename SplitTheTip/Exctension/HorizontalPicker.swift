//
//  HorizontalPicker.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 01.12.2021.
//

import SwiftUI

struct HorizontalPicker: ViewModifier {
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: -90))
            .frame(width: 120, height: 30)
            .pickerStyle(.wheel)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 4)
                    .shadow(color: Color.gray.opacity(0.5), radius:4, x: 0, y: 0)
            )
            .clipped()
    }
}

extension View {
    func horizontalPicker() -> some View {
        modifier(HorizontalPicker())
    }
}



    
