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
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: false),
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
