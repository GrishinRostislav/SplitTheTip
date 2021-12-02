//
//  HorizontalPickerPeople.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 01.12.2021.
//

import SwiftUI

struct PickerPeople: View {
    //MARK: - Properties
    @Binding var numberOfPeople: Int
    
    //MARK: - Body
    var body: some View {
        //Horizontal Picker
        Section(header: Text("How many people?")) {
            Group {
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
                }
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
struct HorizontalPickerPeople_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Form {
                PickerPeople(numberOfPeople: .constant(2))
            }
        }
    }
}
