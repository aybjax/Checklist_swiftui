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
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                // there was index out of range error
                ForEach(checklist.items.indices) { idx in
                    idx < (checklist.items.count ?? 0 ) ?
                        RowView(checklistItem: $checklist.items[idx]) :
                        nil
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(
                // leading: View
                leading: Button(action: {
                    newChecklistItemViewIsVisible = true
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                // trailing: T
                trailing: EditButton()
            )
            .onAppear(){
                checklist.saveListItems()
            }
            .navigationBarTitle("Checklist")
//            .navigationTitle("Checklist")
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: checklist)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
