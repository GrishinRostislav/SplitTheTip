//
//  ButtonRandomPeople.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 01.12.2021.
//

import SwiftUI

struct ButtonRandomPeople: View {
    //MARK: - Properties
    @Binding var arrayOfPercentages: [Int]
    @Binding var selectedPercentage: Int
    
    //MARK: - BODY
    var body: some View {
        Group {
            Button {
                randomTip()
            } label: {
                HStack {
                    Text("Random Tip")
                    Image(systemName: "dice.fill")
                }//HStack
                .font(.title2)
                .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: 200, maxHeight: 60)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 1, x: 2, y: 2)
    }
    //MARK: - RandomTIP
    func randomTip() {
        let randomIndex = Int.random(in: 0..<arrayOfPercentages.count)
        print("Random \(randomIndex)")
        let shuffelTip = arrayOfPercentages.shuffled()
        print(shuffelTip)
        selectedPercentage = shuffelTip[randomIndex]
    }
}

    //MARK: - Preview
struct ButtonRandomPeople_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRandomPeople(arrayOfPercentages: .constant([10, 15, 20, 25, 0]), selectedPercentage: .constant(20))
    }
}
