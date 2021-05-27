//
//  Checklist.swift
//  Checklist
//
//  Created by aybjax on 5/27/21.
//

import Foundation

/**
 ModelView
 */
class Checklist: ObservableObject {
    
    @Published
    var items = [
        CheckListItem(name: "Walk the dog"),
        CheckListItem(name: "Brush my teeth"),
        CheckListItem(name: "Learn iOS development", isChecked: true),
        CheckListItem(name: "Soccer practice"),
        CheckListItem(name: "Eat ice cream", isChecked: false),
    ]
    
    // Methods
    // =======
    
    func printCheckListContent() {
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printCheckListContent()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printCheckListContent()
    }
}
