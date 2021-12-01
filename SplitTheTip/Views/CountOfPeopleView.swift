//
//  CountOfPeopleView.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 29.11.2021.
//

import SwiftUI

struct CountOfPeopleView: View {
    //MARK: - Properties
    
    @Binding var numberOfPeople: Int
    @State private var friends: [String] = []
    @State private var isShowAddFriend = false
    @State private var newFriend = ""
    
    //MARK: - Body
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                //Header
                Text("Select how many people")
                    .headerStyle()
                //Horizontal picker View
                HorizontalPickerPeople(numberOfPeople: $numberOfPeople)
                    .rowStyle()
                //Random people who needs to pay all Tip
                Text("Who needs to pay all tips?")
                    .headerStyle()
            } //VStack
            HStack {
                Button {
                    print("")
                } label: {
                    HStack {
                        Text("Random")
                        Image(systemName: "dice.fill")
                    }
                    .font(.title2)
                    .foregroundColor(.gray)
                }
                .rowStyle()
                
                Button {
                    isShowAddFriend.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Add Friend")
                    }
                    .foregroundColor(.gray)
                }
                .fullScreenCover(isPresented: $isShowAddFriend, content: {
                    AddingNewFriend(friends: $friends)
                })
                .rowStyle()
            }
        } //VStack Global
    }
}

//MARK: - Preview
struct CountOfPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        CountOfPeopleView(numberOfPeople: .constant(4))
    }
}
