//
//  ContentView.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 29.11.2021.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var amount = 0.0 // amount with out tip
    @State private var numberOfPeople = 2 // default number
    @State private var selectedPercentage = 20 // default number of percentage
    @State private var friendsName: [String] = [] //friends name for random tips
    
    
    
    
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                //MARK: - AmountView
                AmountView(amount: $amount)
                
                //MARK: - Tip
                PercentageView(selectedPercentage: $selectedPercentage)
                
                //MARK: - Count of People
                
                CountOfPeopleView(numberOfPeople: $numberOfPeople)
                
                //MARK: - People who have to pay yhe bill
                
                //MARK: - Total from other people
                
                //MARK: - Total Amount
                
            }//ScrollView
            .navigationTitle("Split The Tip")
        }// NavigationView
    }
}


    //MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
