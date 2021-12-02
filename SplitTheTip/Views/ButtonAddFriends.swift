//
//  ButtonAddFriends.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 02.12.2021.
//

import SwiftUI

struct ButtonAddFriends: View {
    //MARK: - Properties
    @Binding var friendsName: [String]
    @State private var showingSheet = false
    
    var peopleCount = 0
    //MARK: - Body
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            HStack {
                Text("Add Friends")
                Image(systemName: "person.badge.plus")
            }//HStack
            .font(.title2)
            .foregroundColor(.gray)
        }
        .sheet(isPresented: $showingSheet) {
            AddingNewFriend(friends: $friendsName, peopleCount: peopleCount)
                }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 1, x: 2, y: 2)
        
    }
}

    //MARK: - Preview
struct ButtonAddFriends_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAddFriends(friendsName: .constant(["Bob"]))
    }
}
