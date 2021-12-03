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
    @State private var arrayOfPercentages = [10, 15, 20, 25, 0]
    @State private var payers: [String] = []
    @FocusState var isInputActive: Bool
    
    var peopleNumber: Int {
        return numberOfPeople + 2
    }
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("BackGround"))
       // UITableViewCell.appearance().backgroundColor = .clear
    }
    
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List {
                //MARK: - AmountView
                
                AmountView(amount: $amount)
                    .listRowSeparator(.hidden)
                
                //MARK: - Tip
                PercentageView(selectedPercentage: $selectedPercentage, arrayOfPercentages: $arrayOfPercentages)
                    .listRowSeparator(.hidden)
                
                //MARK: - Count of People
                PickerPeople(numberOfPeople: $numberOfPeople)
                    .listRowBackground(Color(.clear))
                    .listRowSeparator(.hidden)
                
                //MARK: - Randomize
                Section(header: Text("Trying something...")) {
                    VStack {
                        HStack {
                            ButtonRandomTip(arrayOfPercentages: $arrayOfPercentages, selectedPercentage: $selectedPercentage)
                            ButtonAddFriends(friendsName: $friendsName, peopleCount: numberOfPeople + 2)
                        }
                        //MARK: - People who have to pay yhe bill
                        ButtonRandomPayers(friendsName: friendsName, payers: $payers)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .listRowSeparator(.hidden)
                
                //MARK: - Total Amount
                Section(header: Text("Invoice for payment")) {
                    ListOfPayers(payers: $payers, amount: $amount, percentage: $selectedPercentage, numberOfPeople: peopleNumber)
                }
                .listRowSeparator(.hidden)
            }//List
            .edgesIgnoringSafeArea(.all)
            .listStyle(.grouped)
            .navigationTitle("Split The Tip")
        }// NavigationView
    }
}


//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
