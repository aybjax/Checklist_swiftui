//
//  EditChecklistItem.swift
//  Checklist
//
//  Created by aybjax on 5/28/21.
//

import SwiftUI

struct EditChecklistItemView: View {
    @Binding
    var checklistItem: ChecklistItem
    
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }
    }
}

struct EditChecklistItem_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "A")))
    }
}
