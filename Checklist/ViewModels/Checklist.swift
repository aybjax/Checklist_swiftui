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
    var items: [ChecklistItem] = []
    
    // Methods
    // =======
    
    init() {
        print("Documents directory - \(documentsDirectory())")
        print("Data file - \(dataFilePath())")
        
        loadListItem()
    }
    
    func printCheckListContent() {
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printCheckListContent()
        saveListItems()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printCheckListContent()
        saveListItems()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklist.plist")
    }
    
    func saveListItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            
            print(data)
            
            try data.write(to: dataFilePath(),
                           options: Data.WritingOptions.atomic)
        }
        catch {
            print("Error enciding item array: \(error.localizedDescription)")
        }
    }
    
    func loadListItem() {
        let path = dataFilePath()
        
        guard let data = try? Data(contentsOf: path) else {
            return;
        }
        
        let decoder = PropertyListDecoder()
        
        do {
            items = try decoder.decode([ChecklistItem].self, from: data)
        }
        catch {
            print("Error decoding item array: \(error.localizedDescription)")
        }
    }
}
