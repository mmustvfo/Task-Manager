//
//  TasksPersistenceManager.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import Foundation
import CoreData

class TasksPersistenceManager {
    
    @Published var tasks: [TaskEntity] = []
    private let container: NSPersistentContainer
    private let entityName = "TaskEntity"
    private let containerName = "TaskCD"
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error {
                print("Error while loading Core Data: \(error.localizedDescription)")
                return
            }
        }
        fetchCoreData()
    }
    

    public func deleteTask(task: Task) {
        guard let removingTask = tasks.first(where: { $0.id == task.id }) else {
            fatalError("No task to remove")
        }
        container.viewContext.delete(removingTask)
        refresh()
    }
    
    public func addTask(task: Task) {
        let taskEntity = TaskEntity(context: container.viewContext)
        taskEntity.taskCategoryRawValue = Int16(task.taskCategory.rawValue)
        taskEntity.taskName = task.taskName
        taskEntity.taskDescription = task.taskDescirption
        taskEntity.id = task.id
        taskEntity.dateAdded = task.dateAdded
        refresh()
    }
    
    private func refresh() {
        save()
        fetchCoreData()
    }
    
    private func fetchCoreData() {
        let request = NSFetchRequest<TaskEntity>(entityName: entityName)
        do {
            tasks = try container.viewContext.fetch(request)
        } catch let error {
            print("Error while fetching Core Date: \(error.localizedDescription)")
        }
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error while trying to save viewContext: \(error.localizedDescription)")
        }
    }
    
    
}
