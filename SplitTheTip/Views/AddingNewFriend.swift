//
//  AddingNewFriend.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 30.11.2021.
//

import SwiftUI

struct AddingNewFriend: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var friends: [String]
    @State private var newFriend = ""
    
    
    var body: some View {
        
        NavigationView {
            Form {
                HStack {
                    TextField("Adding new frined", text: $newFriend)
                    Button {
                        if !newFriend.isEmpty {
                            friends.append(newFriend)
                            newFriend = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
                List {
                    ForEach(friends, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Add friend")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        
    }
}

struct AddingNewFriend_Previews: PreviewProvider {
    static var previews: some View {
        AddingNewFriend(friends: .constant(["Bob", "Michael", "Ros"]))
    }
}
