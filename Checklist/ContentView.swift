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
                        .onTapGesture {
//                            self.checkListItems.append(item)
//                            self.checkListItems.remove(at: 0)
                            
                            let indexesToRemove = IndexSet(integersIn: 0...4)
                            self.checkListItems.remove(atOffsets: indexesToRemove)
                        }
                }
            }
            .navigationTitle("Checklist")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
