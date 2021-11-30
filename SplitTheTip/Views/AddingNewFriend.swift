//
//  AddingNewFriend.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 30.11.2021.
//

import SwiftUI

struct AddingNewFriend: View {
    
    let screenSize = UIScreen.main.bounds
    
    @Binding var friends: [String]
    @State private var newFriend = ""
    @Binding var isShown: Bool
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add new friend", text: $newFriend)
                    .frame(width: 200)
                Button {
                    if !newFriend.isEmpty {
                        friends.append(newFriend)
                        newFriend = ""
                    }
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
            
            List{
                ForEach (friends, id: \.self) {
                    Text($0)
                }
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct AddingNewFriend_Previews: PreviewProvider {
    static var previews: some View {
        AddingNewFriend(friends: .constant(["Bob", "Michael", "Ros"]), isShown: .constant(true))
            .previewLayout(.sizeThatFits)
            .frame(maxWidth: .infinity)
    }
}
