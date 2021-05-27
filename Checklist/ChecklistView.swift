//
//  ChecklistView.swift
//  ChecklistView
//
//  Created by aybjax on 5/25/21.
//

import SwiftUI

/**
 View
 */
struct ChecklistView: View {
    // Properties
    // ==========
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        item.isChecked
                            ? Text("✅")
                            : Text("◻️")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = checklist.items.firstIndex(where: {
                                                                            $0.id == item.id}) {
                            checklist.items[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
//            .navigationTitle("Checklist")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
