//
//  AmountView.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 29.11.2021.
//

import SwiftUI

struct AmountView: View {
    //MARK: - Properties
    @Binding var amount: Double
    @FocusState var isInputActive: Bool
    
    
    //MARK: - Body
    var body: some View {
        Section(header: Text("Type Amount")) {
            Group{
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($isInputActive)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isInputActive = false
                            }
                        }
                    }
            }
            .frame(maxHeight: 60)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.5), radius: 1, x: 2, y: 2)
        }
    }
}

//MARK: - Preview
struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AmountView(amount: .constant(100.6))
        }.listStyle(.sidebar)
    }
}
