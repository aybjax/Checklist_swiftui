//
//  ChecklistApp.swift
//  Checklist
//
//  Created by aybjax on 5/25/21.
//

import SwiftUI

// Probably this is instead of app delegate
// ========================================

@main
struct ChecklistApp: App {
    var body: some Scene {
        WindowGroup {
            ChecklistView()
        }
    }
}
