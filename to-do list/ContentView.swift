//
//  ContentView.swift
//  to-do list
//
//  Created by Student on 1/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoList = ToDoList()
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.priority)
                                .font(.headline)
                            Text(item.description)
                            Spacer()
                            Text(item.dueDate, style: .date)
                        }
                    }
                }
                .onMove(perform: { indices, newOffset in
                    toDoList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    toDoList.items.remove(atOffsets: indexSet)
                })
            }
        }
        .navigationBarTitle("to do list", displayMode: .inline)
        .navigationBarItems(leading: EditButton())
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
struct ToDoItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}

