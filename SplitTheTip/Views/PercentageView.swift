//
//  PercentageView.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 29.11.2021.
//

import SwiftUI

struct PercentageView: View {
    //MARK: - Properties
    @Binding var selectedPercentage: Int
    @Binding var arrayOfPercentages: [Int]
    
    //MARK: - Body
    var body: some View {
        //Picker tips
        Section(header: Text("How much tip you want to leave?")) {
            Group {
                Picker("Выберите чаевые", selection: $selectedPercentage) {
                    ForEach(arrayOfPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }//Picker
                .pickerStyle(.segmented)
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.5), radius: 1, x: 2, y: 2)
        }
    }
}

//MARK: - Preview
struct PercentageView_Previews: PreviewProvider {
    static var previews: some View {
        PercentageView(selectedPercentage: .constant(20), arrayOfPercentages: .constant([10, 15, 20, 25, 0]))
            .frame(maxWidth: .infinity)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
