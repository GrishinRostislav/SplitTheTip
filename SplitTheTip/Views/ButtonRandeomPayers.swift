//
//  Payer'sList.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 03.12.2021.
//

import SwiftUI

struct ButtonRandomPayers: View {
    //MARK: - Properties
    var friendsName: [String] = [""]
    @Binding var payers: [String]
    
    //MARK: - Body
    var body: some View {
        Group {
            Button {
              randomPayers()
            } label: {
                HStack {
                    Text("Random Payer's")
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
    
    func randomPayers() {
        payers = [""]
        let randomNumber = Int.random(in: 0...friendsName.count)
        print(randomNumber)
        while payers.count < randomNumber + 1 {
            let addingFirend = friendsName.randomElement() ?? ""
            print(addingFirend)
            if !payers.contains(addingFirend) {
                payers.append(addingFirend)
                print("Added...")
            }
        }
        payers.remove(at: 0)
        print(payers)
    }
}

    //MARK: - Preview
struct Payer_sList_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRandomPayers(payers: .constant(["Bob", "Stive", "Mickal"]))
    }
}
