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
        "Walk the dog",
        "Brush my teeth",
        "Learn iOS development",
        "Soccer practice",
        "Eat ice cream",
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checkListItems, id: \.self) { item in
                    Text(item)
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
