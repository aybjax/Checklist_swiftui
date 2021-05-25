//
//  ContentView.swift
//  Checklist
//
//  Created by aybjax on 5/25/21.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    // ==========
    
    @State
    var checkListItems = [
        CheckListItem(name: "Walk the dog"),
        CheckListItem(name: "Brush my teeth"),
        CheckListItem(name: "Learn iOS development", isChecked: true),
        CheckListItem(name: "Soccer practice"),
        CheckListItem(name: "Eat ice cream", isChecked: false),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checkListItems) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        item.isChecked
                            ? Text("✅")
                            : Text("◻️")
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
//            .navigationTitle("Checklist")
        }
    }
    
    // Methods
    // =======
    
    func printCheckListContent() {
        for item in checkListItems {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        checkListItems.remove(atOffsets: whichElement)
        printCheckListContent()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        checkListItems.move(fromOffsets: whichElement, toOffset: destination)
        printCheckListContent()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
