//
//  TaskEntity.swift
//  Task Manager
//
//  Created by Mustafo on 24/01/23.
//

import Foundation

extension TaskEntity {
    
    var task: Task {
        Task(id: self.id!,dateAdded: self.dateAdded!, taskName: self.taskName!, taskDescirption: self.taskDescription!, taskCategory: Category(rawValue: Int(self.taskCategoryRawValue))!)
    }
    
}
