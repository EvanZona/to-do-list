//
//  ContentView.swift
//  to-do list
//
//  Created by Student on 1/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var things = ["first thing", "second thing", "third thing", "fourth thing", "fifth thing"]
    var body: some View {
        NavigationView {
            List {
                ForEach(things, id: \.self) { thing in
                    Text(thing)
                }
                .onMove(perform: { indices, newOffset in
                    things.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    things.remove(atOffsets: indexSet)
                })
            }
        }
        .navigationBarTitle("things", displayMode: .inline)
        .navigationBarItems(leading: EditButton())
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
