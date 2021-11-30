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
    
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Amount")
                .headerStyle()
            TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .keyboardType(.decimalPad)
                .rowStyle()
        }
    }
}

    //MARK: - Preview
struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(amount: .constant(100.6))
            .frame(maxWidth: .infinity)
            .previewLayout(.sizeThatFits)
    }
}
