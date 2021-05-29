//
//  ChecklistItem.swift
//  Checklist
//
//  Created by aybjax on 5/27/21.
//

import Foundation

/**
 Model
 */
struct ChecklistItem: Identifiable, Codable {
    // Properties
    // ==========
    
    let id = UUID()
    var name: String
    var isChecked: Bool = false
    
    // Methods
    // =======
}
