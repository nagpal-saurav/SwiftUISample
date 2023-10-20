//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Saurav Nagpal on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section("List Expirement") {
                    exapndableListRow()
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func exapndableListRow() -> some View {
        NavigationLink {
            ExpandableList()
        } label: {
            Text("Expandable List")
        }
        NavigationLink {
            HStackAdjustment()
        } label: {
            Text("Hstack Adjustment")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
