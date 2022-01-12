//
//  ToDoList.swift
//  to-do list
//
//  Created by Student on 1/12/22.
//
class ToDoList: ObservableObject {
    @Published var items = [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
                            ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
                            ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
 }
import Foundation
