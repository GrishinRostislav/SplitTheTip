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
    let arrayOfPercentages = [10, 15, 20, 25, 0] //default array of percentage
    
    //MARK: - Body
    var body: some View {
        
        VStack(alignment: .center) {
            VStack(alignment: .leading) { //Header + Picker
                
                //Header
                Text("Сколько чаевых вы хотите оставить?")
                    .headerStyle()
                
                //Picker tips
                Picker("Выберите чаевые", selection: $selectedPercentage) {
                    ForEach(arrayOfPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }//Picker
                .pickerStyle(.segmented)
                .rowStyle()
            } //VStack inner
            
            //Random Button
            Button {
                randomTip()
            } label: {
                HStack {
                    Text("Random")
                    Image(systemName: "dice.fill")
                }//HStack
                .font(.title2)
                .foregroundColor(.gray)
            }
            .rowStyle()// Style for ROW
            .padding(.top, 15)
        }//VStack
    }
    
    //MARK: Selected a random TIP
    //: All of this needs for shuffle percentage 
    func randomTip() {
        let randomIndex = Int.random(in: 0..<arrayOfPercentages.count)
        print("Random \(randomIndex)")
        let shuffelTip = arrayOfPercentages.shuffled()
        print(shuffelTip)
        selectedPercentage = shuffelTip[randomIndex]
    }
}

    //MARK: - Preview
struct PercentageView_Previews: PreviewProvider {
    static var previews: some View {
        PercentageView(selectedPercentage: .constant(20))
            .frame(maxWidth: .infinity)
            .previewLayout(.sizeThatFits)
    }
}
