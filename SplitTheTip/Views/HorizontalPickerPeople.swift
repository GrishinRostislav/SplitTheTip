//
//  HorizontalPickerPeople.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 01.12.2021.
//

import SwiftUI

struct HorizontalPickerPeople: View {
    //MARK: - Properties
    @Binding var numberOfPeople: Int
    
    //MARK: - Body
    var body: some View {
        HStack {
            //Header
            Text("Number of people")
            
            Spacer()
            
            //Horizontal Picker
            Picker("Select number of people", selection: $numberOfPeople) {
                ForEach(2 ..< 100) {
                    Text("\($0)")
                        .rotationEffect(Angle(degrees: 90))
                }
            }
            .horizontalPicker()
        } //HStack Row
    }
}

    //MARK: - Preview
struct HorizontalPickerPeople_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalPickerPeople(numberOfPeople: .constant(2))
    }
}
