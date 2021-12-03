//
//  AddingNewFriend.swift
//  SplitTheTip
//
//  Created by Rostislav Grishin on 30.11.2021.
//

import SwiftUI

struct AddingNewFriend: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var friends: [String]
    @State private var newFriend = ""
    
    var peopleCount = 0
//    
//    init() {
//        UITableView.appearance().backgroundColor = UIColor(Color("BackGround"))
//       // UITableViewCell.appearance().backgroundColor = .clear
//    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("You need to add \(peopleCount - friends.count) more people")) {
                    HStack {
                        TextField("Adding new frined", text: $newFriend)
                        Button {
                            if !newFriend.isEmpty && peopleCount > friends.count {
                                friends.append(newFriend)
                                friends.shuffle()
                                newFriend = ""
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                List {
                    ForEach(friends, id: \.self) {
                        Text($0)
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationTitle("Add friend")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
        .background(Color("BackGround"))
    }
    func delete(at offsets: IndexSet) {
            friends.remove(atOffsets: offsets)
        }
    
}

struct AddingNewFriend_Previews: PreviewProvider {
    static var previews: some View {
        AddingNewFriend(friends: .constant(["Bob", "Michael", "Ros"]))
    }
}
