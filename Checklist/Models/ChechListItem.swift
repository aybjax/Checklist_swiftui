//
//  ChechListItem.swift
//  Checklist
//
//  Created by aybjax on 5/26/21.
//

import Foundation

struct CheckListItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
