//
//  NewChecklistItemView.swift
//  Checklist
//
//  Created by aybjax on 5/28/21.
//

import SwiftUI

struct NewChecklistItemView: View {
    // Properties
    // ========
    
    var checklist: Checklist;
    
    @Environment(\.presentationMode)
    var presentationMode
    
    @State
    var newItemName = ""
    
    var body: some View {
        Text("Add new Item")
        Form {
            TextField("Enter new item name here",
                      text: $newItemName)
            Button(action: {
                let newChecklistItem = ChecklistItem(name: newItemName)
                checklist.items.append(newChecklistItem)
//                print("****************")
//                print(presentationMode)
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add new item")
                }
            }
            .disabled(newItemName.count == 0)
        }
        Text("Swipe down to cancel.")
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
