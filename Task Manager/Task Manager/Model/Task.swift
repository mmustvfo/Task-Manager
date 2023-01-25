//
//  Task.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var dateAdded: Date
    var taskName: String
    var taskDescirption: String
    var taskCategory: Category
}

let tasks = [
    Task(dateAdded: Date(), taskName: "Read a book", taskDescirption: "1984", taskCategory: .general),
    Task(dateAdded: Date(), taskName: "Take a walk", taskDescirption: "10 km", taskCategory: .challenge),
    Task(dateAdded: Date(), taskName: "Take a dance lessons", taskDescirption: "On the ohio", taskCategory: .idea)
]
