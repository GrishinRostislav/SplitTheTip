//
//  ListOfPayers.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 03.12.2021.
//

import SwiftUI

struct ListOfPayers: View {
    //MARK: - Properties
    @Binding var payers: [String]
    @Binding var amount: Double
    @Binding var percentage: Int
    var numberOfPeople: Int
    
    var totalAmount: Double {
        return amount + amount * Double(percentage) / 100
    }
    
    var peopleCount: Int {
        return payers.isEmpty ? 0 : payers.count
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            if peopleCount > 0 && !payers.isEmpty {
                ForEach(payers, id: \.self) { name in
                    HStack {
                        Text(name)
                        Spacer()
                        Text(calculatePerPerson(), format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                }
            }
            HStack {
                Text("Every one need to pay")
                Spacer()
                Text("\(numberOfPeople - peopleCount) x")
                Text(calculateAmount(), format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
            
            HStack {
                Spacer()
                Text("Total")
                Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
        }
    }
    
    func calculatePerPerson() -> Double {
        let amountPercentage = amount * Double(percentage) / 100.0
       
        let percentagePeople = peopleCount != 0 ? amountPercentage / Double(peopleCount) : 0
        let result = amount / Double(numberOfPeople) + percentagePeople
        print("\(result) Per Person")
        return result.isNaN ? 0 : result
    }
    
    func calculateAmount() -> Double {
        let result = (totalAmount - calculatePerPerson() * Double(peopleCount)) / Double(numberOfPeople - peopleCount)
        print("\(result) Per Amount")
        return result.isNaN ? 0 : result
    }
}

//MARK: - Preview
struct ListOfPayers_Previews: PreviewProvider {
    static var previews: some View {
        ListOfPayers(payers: .constant([]), amount: .constant(1000.0), percentage: .constant(20), numberOfPeople: 4)
    }
}
