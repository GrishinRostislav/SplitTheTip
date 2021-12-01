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
                //Row
                HStack {
                    Text("Number of people")
                    Spacer()
                    Picker("Select number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0)")
                                .rotationEffect(Angle(degrees: 90))
                        }
                    }
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 120, height: 30)
                    .pickerStyle(.wheel)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 4)
                            .shadow(color: Color.gray.opacity(0.5), radius:4, x: 0, y: 0)
                    )
                    .clipped()
                } //HStack Row
                .foregroundColor(Color("TitleTextColor"))
                .font(.title3)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 4)
                        .shadow(color: Color.gray.opacity(0.5), radius:4, x: 0, y: 0)
                )
                .padding(.horizontal, 15)
                
                //Random people who needs to pay all Tip
                Text("Who needs to pay all tips?")
                    .headerStyle()
                
            }
            
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
        } //VStack
    }
}

//MARK: - Preview
struct CountOfPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        CountOfPeopleView(numberOfPeople: .constant(4))
            .frame(maxWidth: .infinity)
            .previewLayout(.sizeThatFits)
    }
}
